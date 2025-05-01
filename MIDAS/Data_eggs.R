farming_methods <- c("Cage", "Barn", "FreeRange", "Organic")
start_year <- 2004
end_year <- year(Sys.Date())

get_egg_price_data <- function(country, year, method) {
  begin_date <- paste0("01/01/", year)
  end_date <- paste0("31/12/", year)
  
  url <- paste0(
    "https://www.ec.europa.eu/agrifood/api/poultry/egg/prices?",
    "memberStateCodes=", country,
    "&beginDate=", begin_date,
    "&endDate=", end_date,
    "&farmingMethods=", method
  )
  
  tryCatch({
    response <- GET(url)
    if (status_code(response) == 200) {
      data <- fromJSON(content(response, "text", encoding = "UTF-8"), flatten = TRUE)
      if (length(data) == 0) return(NULL)
      df <- as.data.frame(data)
      df$farmingMethod <- method
      df$country <- country
      Sys.sleep(1)
      return(df)
    } else {
      warning(paste("Błąd HTTP", status_code(response), "dla", country, year, "metoda", method))
      return(NULL)
    }
  }, error = function(e) {
    warning(paste("Błąd połączenia:", e$message))
    return(NULL)
  })
}

# Pobierz dane dla krajów, lat i metod chowu
all_egg_data <- cross_df(list(
  country = eu_countries,
  year = start_year:end_year,
  method = farming_methods
)) %>%
  pmap_dfr(~ get_egg_price_data(..1, ..2, ..3))

write_csv(all_egg_data, "ceny_jaj_z_metodami_chowu_UE_2004_teraz.csv")
cat("✅ Zapisano dane do ceny_jaj_z_metodami_chowu_UE_2004_teraz.csv\n")
