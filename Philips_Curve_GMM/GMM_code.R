library("eurostat")
library("tidyverse")
library("mFilter")
library("gmm")
library('BayesRGMM')

GMM_data_download <- function(country_code){
  # 1. GDP table: 
  # https://ec.europa.eu/eurostat/databrowser/view/namq_10_gdp/default/table?lang=en&category=na10.namq_10.namq_10_ma 
  df_gdp <- get_eurostat("namq_10_gdp", 
                         filters = list(geo = country_code, 
                                        unit = "CLV_I20", 
                                        s_adj = "sCA", 
                                        na_item = "B1GQ"
                         ))    |>
    dplyr::select(time, values) |>
    dplyr::rename(gdp = values) 
  
  df_wage <- tryCatch({
    get_eurostat("namq_10_gdp", 
                 filters = list(geo = country_code, 
                                unit = "CP_MEUR", 
                                s_adj = "SCA", 
                                na_item = "D1"))
  }, error = function(e) {
    message("Nie udało się pobrać danych z SCA, próba z SA")
    # Jeżeli błąd, pobierz z SA
    get_eurostat("namq_10_gdp", 
                 filters = list(geo = country_code, 
                                unit = "CP_MEUR", 
                                s_adj = "SA", 
                                na_item = "D1"))
  })
  
  df_wage <- df_wage |>
    dplyr::select(time, values) |>
    dplyr::rename(wages = values) 
  
  df_gdp_wage_share  <- get_eurostat("namq_10_gdp", 
                                     filters = list(geo = country_code, 
                                                    unit = "CP_MEUR", 
                                                    s_adj = "sCA", 
                                                    na_item = "B1GQ"
                                     ))    |>
    dplyr::select(time, values) |>
    dplyr::rename(gdp = values) 
  
  df_wage <- df_wage |>
    dplyr::inner_join(df_gdp_wage_share, by = "time") |>
    dplyr::mutate(wage_share = wages / gdp) |>
    dplyr::mutate(wages = (log(wages) - lag(log(wages)))*100) |>
    dplyr::select(time, wages, wage_share)
  
  df_final <- df_gdp |>
    dplyr::inner_join(df_wage, by = "time") |>
    na.omit()
  
  # Inflation table:
  # https://ec.europa.eu/eurostat/databrowser/view/prc_hicp_mmor/default/table?lang=en&category=prc.prc_hicp
  df_inflation <- get_eurostat("prc_hicp_mmor",
                               filters = list(geo = country_code,
                                              coicop = c("CP00"))) |> 
    dplyr::select(time, coicop, values) |>
    tidyr::pivot_wider(names_from = coicop, values_from = values) |>
    dplyr::rename(cpi = CP00)
  
  df_final <- df_final |>
    dplyr::inner_join(df_inflation, by = "time") |>
    na.omit()
  
  return(df_final)
}

Calculate_Output_Gap <- function(df) {
  df$time <- as.Date(df$time)
  
  # Wyciągnięcie roku i kwartału początkowego
  start_year <- year(df$time[1])
  start_quarter <- quarter(df$time[1])
  
  # Konwersja do szeregu czasowego (częstotliwość kwartalna)
  gdp_ts <- ts(df["gdp"], start = c(start_year, start_quarter), frequency = 4)
  
  # Filtr Hodricka-Prescotta z freq = 1600 dla kwartalnych danych
  hp_result <- hpfilter(gdp_ts, freq = 1600)
  
  # Dodanie output gap jako nowej kolumny
  df$output_gap <- as.numeric(hp_result$cycle)
  
  return(df)
}

generate_GMM_Features <- function(df){
  df$cpi_lead <- lead(df$cpi, 1)
  df$cpi_lag_1 <- lag(df$cpi, 1)
  df$cpi_lag_2 <- lag(df$cpi, 2)
  df$cpi_lag_3 <- lag(df$cpi, 3)
  df$cpi_lag_4 <- lag(df$cpi, 4)
  
  df$output_gap_lag_1 <- lag(df$output_gap)
  df$output_gap_lag_2 <- lag(df$output_gap,2)
  df$output_gap_lag_3 <- lag(df$output_gap,3)
  
  df$wages_lag_1 <- lag(df$wages, 1)
  df$wages_lag_2 <- lag(df$wages, 2)
  df$wages_lag_3 <- lag(df$wages, 3)
  df$wages_lag_4 <- lag(df$wages, 4)
  
  df$wage_share_lag_1 <- lag(df$wage_share, 1)
  df$wage_share_lag_2 <- lag(df$wage_share, 2)
  df$wage_share_lag_3 <- lag(df$wage_share, 3)
  df$wage_share_lag_4 <- lag(df$wage_share, 4)
  
  return(df)
}

estimate_nkpc_gmm <- function(df) {
  
  df <- df %>% na.omit()
  
  nkpc_moments <- function(theta, data) {
    infl_t     <- data[, "cpi"]
    infl_lead  <- data[, "cpi_lead"]
    infl_lag_1 <- data[, "cpi_lag_1"]
    infl_lag_2 <- data[, "cpi_lag_2"]
    infl_lag_3 <- data[, "cpi_lag_3"]
    infl_lag_4 <- data[, "cpi_lag_4"]
    
    gap_t      <- data[, "output_gap"]
    gap_lag_1  <- data[, "output_gap_lag_1"]
    gap_lag_2  <- data[, "output_gap_lag_2"]
    
    wages_lag_1 <- data[, "wages_lag_1"]
    wages_lag_2 <- data[, "wages_lag_2"]
    wages_lag_3 <- data[, "wages_lag_3"]
    wages_lag_4 <- data[, "wages_lag_4"]
    
    wage_share  <- data[, "wage_share"]
    wage_share_lag_1  <- data[, "wage_share_lag_1"]
    wage_share_lag_2  <- data[, "wage_share_lag_2"]
    wage_share_lag_3  <- data[, "wage_share_lag_3"]
    wage_share_lag_4  <- data[, "wage_share_lag_4"]
    
    gamma_f <- theta[1]
    gamma_b <- theta[2]
    kappa   <- theta[3]
    miu     <- theta[4]
    
    res <- infl_t - gamma_f * infl_lead -  gamma_b * infl_lag_1 - kappa * gap_t - miu
    
    # Instrumenty: infl_lag, ulc_lag (2 instrumenty)
    f <- cbind(res * infl_lag_1, res * infl_lag_2,
               res * infl_lag_3, res * infl_lag_4,
               res * wages_lag_1, res * wages_lag_2, 
               res * wages_lag_3, res * wages_lag_4, 
               res * wage_share_lag_1, res * wage_share_lag_2,
               res * wage_share_lag_3, res * wage_share_lag_4)
    return(f)
  }
  
  start_vals <- c(gamma_f = 0.7, 
                  gamma_b = 0.3, 
                  kappa =  0.1,
                  miu = 0)  # wartości początkowe
  gmm_result <- gmm(nkpc_moments, x = df, t0 = start_vals,   
                    type = "twoStep", kernel = "Quadratic Spectral", vcov = "HAC", 
                    bw = bwNeweyWest)
  
  return(gmm_result)
}

compute_GMM_proc <- function(country_code, Test_Sample = FALSE){
  
  df <- GMM_data_download(country_code)
  
  if (Test_Sample == TRUE) {
    df <- df |> filter(time < "2015-01-01")
  }
  
  df <- Calculate_Output_Gap(df)
  df <- generate_GMM_Features(df)
  model <- estimate_nkpc_gmm(df)
  
  return(model)
}

compare_params <- function(Test_Sample = FALSE){
  file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")
  eu_countries <- c("AT", "BE", "CZ","DK","FR","DE", 
                    "HU","IT","NL","PL","SK","ES","SE")
  
  final_coefficients <- c()
  for(country_code in eu_countries){
    print(country_code)
    model <- compute_GMM_proc(country_code, Test_Sample)
    
    # Wyciągnięcie współczynników
    coefficients <- model$coefficients
    
    # Ochyleń std
    std_errors <- sqrt(diag(model$vcov))
    
    # Testu J
    J_stat <- model$objective * model$n
    df_j   <- model$q - model$k
    p_val  <- 1 - pchisq(J_stat, df_j)
    j_test <- c(J_stat, df_j, p_val)
    
    coefficients <- c(country_code, coefficients, std_errors, j_test)
    
    final_coefficients <- rbind(coefficients, final_coefficients)
  }   
  
  colnames(final_coefficients) <- c("Country", "gamma_f", "gamma_b", "kappa", 'miu',  
                                    "gamma_f_std", "gamma_b_std", "kappa_std", 'miu_std',
                                    "J_stat", "df_j", "p_val")
  
  final_coefficients <- final_coefficients |> as.data.frame() |>
    mutate(gamma_f = as.numeric(gamma_f),
           gamma_b = as.numeric(gamma_b),
           kappa = as.numeric(kappa))
  
  if (Test_Sample == TRUE) {
    file_name <- "GMM_coefficients_Test.csv"
  } else {
    file_name <- "GMM_coefficients.csv"
  }
  
  write.csv(final_coefficients, 
            paste0(file_path, file_name),
            row.names = FALSE)
}

if (sys.nframe() == 0) {
    compare_params(Test_Sample = FALSE)
    compare_params(Test_Sample = TRUE)
  
}