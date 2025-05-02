# install.packages("rstan", dependencies = TRUE)
library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")
source(paste0(file_path, "GMM_code.R"))

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
    pi_lead1 = df$cpi_lead,
    pi_lag1 = df$cpi_lag,
    x_t = df$output_gap
  )
  
  fit <- stan(
    file = paste0(file_path, "nkpc.stan"),
    data = stan_data,
    iter = 2000,
    warmup = 500,
    chains = 4,
    seed = 123
  )
  
  stan_summary <- summary(fit, pars = c("beta", "kappa", "sigma"))$summary |>
    as.data.frame()
  return(stan_summary)
  
}

gather_Bayesian_Parameters <- function(Test_Sample = FALSE){ 
  models_collection <- c() 
  countries <- c("AT", "BE", "BG", "HR", "CY", "CZ", "DK", "EE", "FI", "FR", 
                 "DE", "EL", "HU", "IE", "IT", "LV", "LT", "LU", "MT", 
                 "NL", "PL", "PT", "RO", "SK", "SI", "ES")
  
  for (country in countries) {
    print(country)
    df <- GMM_data_download(country)
    df <- Calculate_Output_Gap(df)
    df <- generate_Bayesian_Model_Features(df)
  
    if (Test_Sample == TRUE) {
      df <- df %>% filter(time < "2020-01-01")
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
  gather_Bayesian_Parameters(TRUE)
}