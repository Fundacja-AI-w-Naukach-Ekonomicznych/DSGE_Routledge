# install.packages("midasr")
library(tidyverse)
library(midasr)
library(readxl)
help(p="midasr")

file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")

df_monthly <- read.csv(paste0(file_path, "Eurostat_HICP/Eurostat_FUEL.csv"))
df_weekly <- read_excel(paste0(file_path, "EC_energy.xlsx")) |>  
  mutate(across(-Date, ~ (log(.) - lag(log(.))) * 100))

ger_monthly <- df_monthly |> 
  dplyr::select(time, DE)
ger_weekly <- df_weekly |> 
  dplyr::select(Date, starts_with("DE")) 

full_weeks <- tibble(Date = seq(min(ger_weekly$Date),
                                max(ger_weekly$Date), by = "week"))
ger_weekly <- full_weeks |> left_join(ger_weekly, by = "Date") |> 
  mutate(across(-Date, ~ ifelse(is.na(.), 0, .))) 

diff_days <- diff(ger_monthly$time)
unique(diff_days)


mlag <- function(x, k) embed(x, k)
x_lags <- mlag(ger_weekly$DE_euro95, 5)

