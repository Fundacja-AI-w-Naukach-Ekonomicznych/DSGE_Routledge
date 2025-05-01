library("eurostat")
library("tidyverse")
library("mFilter")
library("gmm")

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
  df$output_gap_lag <- lag(df$output_gap)

  return(df)
}

estimate_nkpc_gmm <- function(df) {
  
  df <- df %>% na.omit()
  
  nkpc_moments <- function(theta, data) {
    infl_t     <- df[, "cpi"]
    infl_lead  <- data[, "cpi_lead"]
    infl_lag   <- data[, "cpi_lag"]
    infl_lag_2 <- data[, "cpi_lag"]
    gap_t      <- data[, "output_gap"]
    gap_lag    <- data[, "output_gap_lag"]
    
    gamma_f <- exp(theta[1]) / (1 + exp(theta[1]))
    kappa   <- exp(theta[2])

    res <- infl_t - gamma_f * infl_lead -  (1-gamma_f) * infl_lag - kappa * gap_t 
    
    # Instrumenty: infl_lag, ulc_lag (2 instrumenty)
    f <- cbind(res * infl_lag_2, res * gap_lag)
    return(f)
  }
  
  start_vals <- c(0.7, 0.3)  # wartości początkowe
  gmm_result <- gmm(nkpc_moments, x = df, t0 = start_vals,   
                    type = "twoStep", kernel = "Quadratic Spectral", vcov = "HAC")
  
  return(gmm_result)
}

compute_GMM_proc <- function(country_code, Covid_flag = FALSE){
  
  df <- GMM_data_download(country_code)
  
  if (Covid_flag == TRUE) {
    df <- df |> filter(time < "2020-01-01")
  }
  
  df <- Calculate_Output_Gap(df)
  df <- generate_GMM_Features(df)
  model <- estimate_nkpc_gmm(df)
  
  return(model)
}

compare_params <- function(Covid_flag = FALSE){
  file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")
  eu_countries <- c("AT","BE","BG","HR","CY","CZ","DK","EE","FI","FR","DE","EL",
                    "HU","IE","IT","LV","LT","LU","MT","NL","PL","PT","RO","SK","SI","ES","SE")
  
  final_coefficients <- c()
  for(country_code in eu_countries){
    model <- compute_GMM_proc(country_code, Covid_flag)
    
    # Wyciągnięcie współczynników
    coefficients <- model$coefficients
    coefficients <- c(country_code, coefficients)
    final_coefficients <- rbind(coefficients, final_coefficients)
  }   
  
  colnames(final_coefficients) <- c("Country", "gamma_f", "kappa")
  final_coefficients <- final_coefficients |> as.data.frame() |>
    mutate(gamma_f = exp(as.numeric(gamma_f)) / (1 + exp(as.numeric(gamma_f))),
           gamma_b = 1 - gamma_f,
           kappa = exp(as.numeric(kappa)))
  
  if (Covid_flag == TRUE) {
    file_name <- "GMM_coefficients_preCovid.csv"
  } else {
    file_name <- "GMM_coefficients.csv"
  }
  
  write.csv(final_coefficients, 
            paste0(file_path, file_name),
            row.names = FALSE)
}

compare_params(Covid_flag = TRUE)
