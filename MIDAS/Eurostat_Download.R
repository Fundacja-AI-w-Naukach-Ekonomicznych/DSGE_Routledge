
library("eurostat")

file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")

download_eurostat_series <- function(item_code, file_path){
  
    df <- get_eurostat("prc_hicp_mmor",
                    filter = list(coicop = item_code)) |>
    dplyr::select(geo, time, values) |>
    dplyr::filter(time >= "2010-01-01") |>
    tidyr::pivot_wider(names_from = geo, values_from = values) 

    write.csv(df, paste0(file_path, "Eurostat_HICP/Eurostat_", item_code, ".csv"), row.names = FALSE)
}

download_key_series <- function(file_path) {
  item_codes <- c("FUEL", "TOT_X_NRG_FOOD", "FOOD", "NRG", "CP00")
  for (item_code in item_codes) 
    download_eurostat_series(item_code, file_path)
    
}

if (sys.nframe() == 0) {
  download_key_series(file_path)
}