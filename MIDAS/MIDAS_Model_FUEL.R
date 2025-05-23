# install.packages("midasr")
library(tidyverse)
library(midasr)
library(readxl)
library(caret)
help(p="midasr")

file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")

restructure_weekly_data <- function(df_weekly){
  full_weeks <- tibble(Date = seq(min(df_weekly$Date), 
                                  max(df_weekly$Date), by = "week"))
  
  df_weekly <- full_weeks |> 
    left_join(df_weekly, by = "Date") |> 
    mutate(across(-Date, ~ ifelse(is.na(.), 0, .))) %>%
    mutate(
      year = year(.data[["Date"]]),
      month = month(.data[["Date"]])
    ) %>%
    group_by(year, month) %>%
    arrange(.data[["Date"]]) %>%
    mutate(week_in_month = row_number()) %>%
    ungroup()
  
  df_weekly <- df_weekly %>%
    mutate(
      across(
        .cols = -c(Date, year, month, week_in_month), 
        .fns = ~ ifelse(week_in_month == 4,
                        . + lead(., 1L, default = 0) * (lead(week_in_month, 1L) == 5),
                        .)
      ))

  df_weekly <- df_weekly %>%
    filter(week_in_month != 5) %>%
    select(-year, -month, -week_in_month)
  
  return(df_weekly)
}

generate_weekly_time_series <- function(df_weekly){
  ts_list <- df_weekly  %>%  dplyr::select(-Date) %>% 
    map(~ ts(., start = c(2010, 1), frequency = 48))
  walk2(ts_list, names(ts_list), ~ assign(.y, .x, envir = .GlobalEnv))
  return(ts_list)
}

generate_MIDAS_formula <- function(df_weekly, restricted = FALSE){
  vars <- colnames(df_weekly)[-1]
  
  if (restricted == FALSE) {
    rhs <- paste0("fmls(", vars, ", 3, m = 4)", collapse = " + ")
  }
  else{
    rhs <- paste0("fmls(", vars, ", 3, m = 4, nbeta)", collapse = " + ")
  }
  form <- as.formula(paste0("y ~ mls(y,1,1) +", rhs), env = environment())
  return(form)
}

generate_MIDAS_data <- function(df_weekly, df_monthly){
  ts_monthly <- ts(df_monthly[,2], start = c(2010, 1), frequency = 12)
  ts_list <- generate_weekly_time_series(df_weekly)

  max_length <- 4 * length(ts_monthly)
  
  # Przytnij wszystkie szeregi w liście do max_length
  ts_list <- lapply(ts_list, function(ts_series) {
    if (length(ts_series) > max_length) {
      window(ts_series, end = time(ts_series)[max_length])
    } else {
      ts_series
    }
  })
  
  ts_list$y <- ts_monthly
  assign("y", ts_monthly, envir = .GlobalEnv)
  return(ts_list)
}

generate_MIDAS_starters <- function(df_weekly){
  var_names <- colnames(df_weekly)[-1]
  n_vars <- length(var_names)
  
  starts <- vector("list", n_vars)
  names(starts) <- paste0("nbeta", seq_len(n_vars))
  starts[] <- list(rep(0.1, 4))
  return(starts)
}

test_Structure_weekly_data <- function(df){
  diff_days <- diff(df$Date)
  return(unique(diff_days))
}

generate_test_forecast <- function(df_weekly, df_monthly){
  
  months_seq <- seq.Date(from = as.Date("2020-01-01"),
                         to   = as.Date("2024-12-01"),
                         by   = "month") 
  
  results_df <- tibble::tibble(
    date = as.Date(character()),
    forecast = numeric(),
    actual = numeric()
  )
  
  i <- "2020-01-01"
  for (i in months_seq) {
    i <- as.Date(i)
    
    train_weekly <- df_weekly %>% filter(Date < i) 
    train_monthly <- df_monthly %>% filter(Date < i)

    MIDAS_train_data <- generate_MIDAS_data(train_weekly, train_monthly)
    MIDAS_test_data <- generate_MIDAS_data(df_weekly, df_monthly)
    
    model <- midas_u(MIDAS_form, data = MIDAS_train_data)
    pred <- predict(model, newdata = MIDAS_test_data)  
    pred <- c(NA, pred)
    
    temp_df <- cbind(df_monthly, pred) %>%  filter(Date == as.Date(i)) 
    colnames(temp_df) <- c("date", "actual", "forecast")       
    
    results_df <- results_df %>%
      add_row(date = temp_df$date,
              forecast = temp_df$forecast,
              actual = temp_df$actual)
    
  }
  
  return(results_df)
}

create_bulk_forecasts <- function(df_weekly, df_monthly){
  countries<- c("DE", "FR", "IT", "ES", "PL", "NL")
  final_results_df <- data.frame()
  
  for (country in countries) {
    country_monthly <- df_monthly |> 
      dplyr::mutate(Date = as.Date(paste0(time, "-01"), format = "%Y-%m-%d")) |>
      dplyr::select(Date, !!sym(country)) 
    
    country_weekly <- df_weekly |>  dplyr::select(Date, starts_with("DE"))
    country_weekly <- country_weekly |>  restructure_weekly_data() 
    
    MIDAS_form <- generate_MIDAS_formula(country_weekly)
    assign("MIDAS_form", MIDAS_form, envir = .GlobalEnv)
    
    results_df <- generate_test_forecast(country_weekly, country_monthly)
    results_df <- results_df %>% mutate(country = country) 
    
    final_results_df <- rbind(final_results_df, results_df)
  }
  return(final_results_df)
}

create_bulk_diagnostics <- function(df_forecasts){
  countries<- c("DE", "FR", "IT", "ES", "PL", "NL")

  diagnostics_df <- data.frame(
    country = character(),
    RMSE = numeric(),
    R2 = numeric(),
    MAE = numeric())
  
  for (country in countries){
    temp_df <- df_forecasts |> 
      filter(country == !!country) |> 
      select(date, forecast, actual)
    
    test_diag <- postResample(pred = temp_df$forecast, 
                              obs = temp_df$actual)
    
    diagnostics_df <- diagnostics_df %>%
      add_row(country = country,
              RMSE = test_diag[1],
              R2 = test_diag[2],
              MAE = test_diag[3])
  }
  
  return(diagnostics_df)
}

print_test_forecasts <- function(results_df){
  df_long <- results_df %>%
    pivot_longer(cols = c(forecast, actual), names_to = "typ", values_to = "wartosc")
  
  # Rysuj wykres
  ggplot(df_long, aes(x = date, y = wartosc, color = typ)) +
    geom_line(size = 1) +
    labs(title = "Prognoza vs Wartość rzeczywista",
         x = "Okres", y = "Wartość") +
    theme_minimal()
}

if (sys.nframe() == 0) {
  df_monthly <- read.csv(paste0(file_path, "Eurostat_HICP/Eurostat_FUEL.csv"))
  df_weekly <- read_excel(paste0(file_path, "EC_energy.xlsx")) |>  
    mutate(across(-Date, ~ (log(.) - lag(log(.))) * 100))
  
  result <- create_bulk_forecasts(df_weekly, df_monthly)
  diagnostics <- create_bulk_diagnostics(result)
  
  print_test_forecasts(result %>% filter(country == "PL"))
}