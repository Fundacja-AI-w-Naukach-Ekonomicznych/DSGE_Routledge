library(tidyverse)
library(eurostat)

country_code <- "EA20"
file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")
source(paste0(file_path, "SWW_2014_data_download.R"))

add_inflation_mod <- function(df) {
  # Inflation table:
  # https://ec.europa.eu/eurostat/databrowser/view/prc_hicp_mmor/default/table?lang=en&category=prc.prc_hicp
  
  df_inflation <- get_eurostat("prc_hicp_mmor",
                               filters = list(geo = country_code,
                                              coicop = c("TOT_X_NRG_FOOD", "NRG", "FOOD")))
  
  df_inflation_MoM <- df_inflation |> 
    dplyr::select(time, coicop, values) |>
    tidyr::pivot_wider(names_from = coicop, values_from = values) |>
    dplyr::rename(pi_core_obs = TOT_X_NRG_FOOD, 
                  pi_energy_obs = NRG,
                  pi_food_obs = FOOD) |>
    na.omit()
  
  df_inflation_QoQ <- df_inflation_MoM |>
    mutate(quarter = floor_date(time, unit = "quarter")) |>
    group_by(quarter) |>
    summarise(
      pi_core_obs = sum(pi_core_obs, na.rm = TRUE) %>% round(2),
      pi_energy_obs = sum(pi_energy_obs, na.rm = TRUE) %>% round(2),
      pi_food_obs = sum(pi_food_obs, na.rm = TRUE) %>% round(2)
    ) |>
    dplyr::rename(time = quarter)
  
  df <- df |>
    dplyr::left_join(df_inflation_QoQ, by = "time")
  
  return(df)
}


Inflation_Mod_SWW_Excel <- function(file_path,country_code){
  df <- basic_SWW_download(country_code)
  df <- add_inflation_mod(df)
  
  library(openxlsx)
  output_path <- gsub(file_path, pattern = "_Data_Scripts/", replacement = "_Mod_Philips_Curve/")
  write.xlsx(df, file = paste0(output_path, "SWW_data.xlsx"), 
             colNames = TRUE, rowNames = FALSE, overwrite = TRUE)
}

Inflation_Mod_SWW_Excel(file_path = file_path, country_code = country_code)

# 1. Consumption table: 
# https://ec.europa.eu/eurostat/databrowser/view/namq_10_fcs/default/table?lang=en&category=na10.namq_10.namq_10_ma

# df_consumption <- get_eurostat("namq_10_fcs",
#                        filters = list(geo = country_code,
#                                       unit = "CLV_PCH_PRE", # Change: Previous Period
#                                       s_adj = "sCA",
#                                       na_item = c("P31_S14", "P313_S14")))
# 
# df_consumption_QoQ <- df_consumption |> dplyr::select(time, na_item, values) |>
#   tidyr::pivot_wider(names_from = na_item, values_from = values) |>
#   dplyr::rename(dc2_obs = P31_S14, dc2_obs_non_durable = P313_S14) |>
#   na.omit()
# 
# df <- df |>
#   dplyr::left_join(df_consumption_QoQ, by = "time")
