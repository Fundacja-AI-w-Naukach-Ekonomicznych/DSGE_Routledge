# install.packages("rstan", dependencies = TRUE)
library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")
source(paste0(file_path, "GMM_code.R"))

Bayesian_data_download <- function(country_code){
  df <- GMM_data_download(country_code)
  EA_countries <- c("AT", "BE","FR","DE","IT","NL","SK","ES")
    
  if (country_code %in% EA_countries){
    df_rates <- get_eurostat("irt_st_m", 
                             filters = list(geo = "EA",
                                            int_rt = "IRT_M3"))
  }
  else {
    df_rates <- get_eurostat("irt_st_m", 
                             filters = list(geo = gsub("[0-9]", "", country_code),
                                            int_rt = "IRT_M3"))
  }
  df_rates <- df_rates |>  dplyr::select(time, values) |>
    dplyr::rename(interest_rate = values) |>
    dplyr::mutate(interest_rate = interest_rate / 4) |>
    na.omit()
  
  df <- df |>
    dplyr::inner_join(df_rates, by = "time")
  
  return(df)
}

generate_Bayesian_Model_Features <- function(df){
  df$cpi_lead <- lead(df$cpi, 1)
  df$cpi_lag <- lag(df$cpi, 1)
  
  df <- df %>% na.omit()
  return(df)
}

gemerate_Bayesian_Model <- function(df){
  N <- nrow(df)
  stan_data <- list(
    N = N,
    pi_t = df$cpi,
    x_t = df$output_gap,
    i_t = df$interest_rate
  )
  
  options(mc.cores = parallel::detectCores(logical = FALSE))
  fit <- stan(
    file = paste0(file_path, "nkpc_three_equations.stan"),
    data = stan_data,
    iter = 4000,
    warmup = 2000,
    chains = 8,
    seed = 123,
    control = list(
      max_treedepth = 15,
      adapt_delta = 0.95
    )
  )
  
  stan_summary <- summary(fit, pars = c("beta", "kappa"))$summary |>
    as.data.frame()
  return(stan_summary)
}

gather_Bayesian_Parameters <- function(Test_Sample = FALSE){ 
  models_collection <- c() 
  countries <- c("CZ","DK","HU","PL","SE")
  
  for (country in countries) {
    print(country)
    df <- Bayesian_data_download(country)
    df <- Calculate_Output_Gap(df)
    df <- generate_Bayesian_Model_Features(df)
    
    if (Test_Sample == TRUE) {
      df <- df %>% filter(time < "2015-01-01")
    }
    
    model <- gemerate_Bayesian_Model(df)
    model$country <- country 
    models_collection <- rbind(models_collection, model)
  }
  
  if (Test_Sample == TRUE) {
    file_name <- "Bayesian_Parameters_Test.csv"
  } else {
    file_name <- "Bayesian_Parameters.csv"
  }
  write.csv(models_collection, file = paste0(file_path, file_name), row.names = TRUE)
}

if (sys.nframe() == 0) {
  gather_Bayesian_Parameters(Test_Sample = TRUE)
  gather_Bayesian_Parameters(Test_Sample = FALSE)
}