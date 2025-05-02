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
                                        unit = "CLV_I20", # Change: Previous Period
                                        s_adj = "sCA", 
                                        na_item = "B1GQ"
                         ))    |>
    dplyr::select(time, values) |>
    dplyr::rename(gdp = values) 
    
  # Inflation table:
  # https://ec.europa.eu/eurostat/databrowser/view/prc_hicp_mmor/default/table?lang=en&category=prc.prc_hicp
  df_inflation <- get_eurostat("prc_hicp_mmor",
                               filters = list(geo = country_code,
                                              coicop = c("CP00"))) |> 
    dplyr::select(time, coicop, values) |>
    tidyr::pivot_wider(names_from = coicop, values_from = values) |>
    dplyr::rename(cpi = CP00)
  
  df_final <- df_gdp |>
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
  df$cpi_lag <- lag(df$cpi, 1)
  df$cpi_lag_2 <- lag(df$cpi, 2)
  df$cpi_lag_3 <- lag(df$cpi, 3)
  df$cpi_lag_4 <- lag(df$cpi, 4)
  df$output_gap_lag <- lag(df$output_gap)
  df$output_gap_lag_2 <- lag(df$output_gap,2)
  df$output_gap_lag_3 <- lag(df$output_gap,3)
  
  return(df)
}

estimate_nkpc_gmm <- function(df) {
  
  df <- df %>% na.omit()
  
  nkpc_moments <- function(theta, data) {
    infl_t     <- data[, "cpi"]
    infl_lead  <- data[, "cpi_lead"]
    infl_lag   <- data[, "cpi_lag"]
    infl_lag_2 <- data[, "cpi_lag_2"]
    infl_lag_3 <- data[, "cpi_lag_3"]
    infl_lag_4 <- data[, "cpi_lag_4"]
    
    gap_t      <- data[, "output_gap"]
    gap_lag    <- data[, "output_gap_lag"]
    gap_lag_2    <- data[, "output_gap_lag_2"]
    gap_lag_3    <- data[, "output_gap_lag_3"]
    
    if (theta[1] < 0 || theta[1] > 1 || theta[2] < 0) {
      return(matrix(1e6, nrow = nrow(data), ncol = 4))  # 4 instrumenty
    }
    
    gamma_f <- theta[1]
    kappa   <- theta[2]

    res <- infl_t - gamma_f * infl_lead -  (1-gamma_f) * infl_lag - kappa * gap_t 
    
    # Instrumenty: infl_lag, ulc_lag (2 instrumenty)
    f <- cbind(res * infl_lag, res * infl_lag_2,
               res * gap_lag, res * gap_lag_2)
    return(f)
  }
  
  start_vals <- c(0.7, 0.1)  # wartości początkowe
  gmm_result <- gmm(nkpc_moments, x = df, t0 = start_vals,   
                    type = "iterative", kernel = "Quadratic Spectral", vcov = "HAC", 
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
  eu_countries <- c("AT","BE","BG","HR","CY","CZ","DK","EE","FI","FR","DE","EL",
                    "HU","IE","IT","LV","LT","LU","MT","NL","PL","PT","RO","SK","SI","ES","SE")
  
  final_coefficients <- c()
  for(country_code in eu_countries){
    print(country_code)
    model <- compute_GMM_proc(country_code, Test_Sample)
    
    # Wyciągnięcie współczynników
    coefficients <- model$coefficients
    coefficients <- c(country_code, coefficients)
    final_coefficients <- rbind(coefficients, final_coefficients)
  }   
  
  colnames(final_coefficients) <- c("Country", "gamma_f", "kappa")
  final_coefficients <- final_coefficients |> as.data.frame() |>
    mutate(gamma_f = as.numeric(gamma_f),
           gamma_b = 1 - gamma_f,
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
}