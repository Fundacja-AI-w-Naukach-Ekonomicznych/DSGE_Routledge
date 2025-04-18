library(tidyverse)
library(eurostat)

country_code <- "EA20"
file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")

# 1. GDP table: 
# https://ec.europa.eu/eurostat/databrowser/view/namq_10_gdp/default/table?lang=en&category=na10.namq_10.namq_10_ma 

df_gdp <- get_eurostat("namq_10_gdp", 
                       filters = list(geo = country_code, 
                                      unit = "CLV_PCH_PRE", # Change: Previous Period
                                      s_adj = "sCA", 
                                      na_item = c("B1GQ", "P3", "P51G") # Change: GDP, COns, Inv
                                      )) 

df_final <- df_gdp |> dplyr::select(time, na_item, values) |>
  tidyr::pivot_wider(names_from = na_item, values_from = values) |>
  dplyr::rename(dy_obs = B1GQ, dc_obs = P3, di_obs = P51G) |>
  na.omit() 

# 2. Labour market:
# https://ec.europa.eu/eurostat/databrowser/view/lfsi_emp_q/default/table?lang=en&category=labour.employ.lfsi.lfsi_emp
# https://ec.europa.eu/eurostat/databrowser/view/une_rt_q/default/table?lang=en&category=labour.employ.lfsi.une

# Employtment
df_emp <- get_eurostat("lfsi_emp_q", 
                       filters = list(geo = country_code, 
                                      unit = "THS_PER", sex = "T",
                                      s_adj = "SA", age = "Y15-64",
                                      indic_em = "EMP_LFS" # Employment
                       )) |>
  dplyr::select(time, values) |>
  dplyr::rename(de_obs = values) |>
  dplyr::mutate(de_obs = de_obs / lag(de_obs)*100-100) |>
  dplyr::mutate(de_obs = round(de_obs,1)) |>
  na.omit()

df_final <- df_final |>
  dplyr::inner_join(df_emp, by = "time") 

# Unemployment rate
df_urate <- get_eurostat("une_rt_q", 
                       filters = list(geo = country_code, 
                                      unit = "PC_ACT", sex = "T",
                                      s_adj = "SA", age = "Y15-74"
                       )) |>
  dplyr::select(time, values) |>
  dplyr::rename(u_obs = values) |>
  na.omit()

df_final <- df_final |>
  dplyr::inner_join(df_urate, by = "time") 

# 3. Real wage and inflation rate:
# https://ec.europa.eu/eurostat/databrowser/view/namq_10_gdp/default/table?lang=en&category=na10.namq_10.namq_10_ma 

df_wages <- get_eurostat("namq_10_gdp", 
                       filters = list(geo = country_code, 
                                      unit = "CP_MNAC", 
                                      s_adj = "sCA", 
                                      na_item = "D1" 
                       )) |>
  dplyr::select(time, values) |>
  dplyr::rename(dw_obs = values) |>
  dplyr::mutate(dw_obs = dw_obs / lag(dw_obs)*100-100) |>
  dplyr::mutate(dw_obs = round(dw_obs,1)) |>
  na.omit()

df_prices <- get_eurostat("namq_10_gdp", 
                         filters = list(geo = country_code, 
                                        unit = "PD_PCH_PRE_NAC", 
                                        s_adj = "sCA", 
                                        na_item = "B1GQ" 
                         )) |>
  dplyr::select(time, values) |>
  dplyr::rename(pi_obs = values) |>
  na.omit()

df_wages <- df_wages |>
  dplyr::inner_join(df_prices, by = "time") |>
  dplyr::mutate(dw_obs = dw_obs - pi_obs) 

df_final <- df_final |>
  dplyr::inner_join(df_wages, by = "time")

# 4. Interest rate:
# https://ec.europa.eu/eurostat/databrowser/view/irt_st_q/default/table?lang=en&category=irt.irt_st
df_rates <- get_eurostat("irt_st_q", 
                          filters = list(geo = gsub("[0-9]", "", country_code),
                                         int_rt = "IRT_M3")) |>
  dplyr::select(time, values) |>
  dplyr::rename(r_obs = values) |>
  na.omit()

df_final <- df_final |>
  dplyr::inner_join(df_rates, by = "time")

# Write to XLXS:
library(openxlsx)
write.xlsx(df_final, file = paste0(file_path, "SWW_data.xlsx"), 
           colNames = TRUE, rowNames = FALSE, overwrite = TRUE)
