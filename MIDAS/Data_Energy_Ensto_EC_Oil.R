library(tidyverse)
library(curl)
library(openxlsx)

file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")

help(p ="curl")

download_energy_ensto <- function(){
  # https://ember-energy.org/data/european-wholesale-electricity-price-data/
  URL <- "https://storage.googleapis.com/emb-prod-bkt-publicdata/public-downloads/price/outputs/european_wholesale_electricity_price_data_daily.csv"

  curl_download(URL, destfile = paste0(file_path,"entso_energy.csv"))
  
  df <- read.csv(paste0(file_path,"entso_energy.csv")) |> 
    dplyr::select(-Country) |>
    dplyr::rename(country = ISO3.Code,
                  price_energy = Price..EUR.MWhe.) |>
    tidyr::pivot_wider(names_from = country, 
                       names_prefix = "Energy_", 
                       values_from = price_energy)
  
  write.csv(df, paste0(file_path,"entso_energy.csv"), row.names = FALSE)  
}

# https://energy.ec.europa.eu/data-and-analysis/weekly-oil-bulletin_en

download_energy_commission <- function(){
  URL <- "https://energy.ec.europa.eu/document/download/906e60ca-8b6a-44e7-8589-652854d2fd3f_en?filename=Weekly_Oil_Bulletin_Prices_History_maticni_4web.xlsx"
  # downloads: 
  curl_download(URL, destfile = paste0(file_path,"EC_energy.xlsx"))
  
  df <- read.xlsx(paste0(file_path,"EC_energy.xlsx"), sheet = "Prices with taxes") |>
    select(-contains("CTR")) |>
    dplyr::slice(-(1:2)) |>
    mutate(
      across(everything(), ~ as.numeric(.x)),
      across(1, ~ as.Date(.x, origin = "1899-12-30")),
    ) |>
    rename_with(~ gsub("price_with_tax_", "", .x)) |>
    dplyr::rename(Date = Consumer.prices.of.petroleum.products.inclusive.of.duties.and.taxes) |>
    dplyr::filter(!is.na(Date), Date >= "2010-01-01") |>
    dplyr::select(where(~ !all(is.na(.)))) |>
    dplyr::arrange(Date) 
  
  write.xlsx(df, paste0(file_path,"EC_energy.xlsx"), rownames = FALSE)
}

download_energy_ensto()  
download_energy_commission()  
