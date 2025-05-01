library(httr)
library(jsonlite)
library(dplyr)
library(lubridate)
library(purrr)
library(readr)

# Lista kodów 27 krajów UE (standard ISO ALPHA-2)
eu_countries <- c("AT","BE","BG","HR","CY","CZ","DK","EE","FI","FR","DE","EL",
                  "HU","IE","IT","LV","LT","LU","MT","NL","PL","PT","RO","SK","SI","ES","SE")

# Parametry
carcass_category <- "cows"
start_year <- 2004
end_year <- year(Sys.Date())

# Funkcja pobierająca dane dla kraju i roku
get_beef_data_for_country_year <- function(country, year) {
  begin_date <- paste0("01/01/", year)
  end_date <- paste0("31/12/", year)
  
  url <- paste0(
    "https://www.ec.europa.eu/agrifood/api/beef/prices?",
    "memberStateCodes=", country,
    "&beginDate=", begin_date,
    "&endDate=", end_date,
    "&carcassCategories=", carcass_category
  )
  
  tryCatch({
    response <- GET(url)
    if (status_code(response) == 200) {
      data <- fromJSON(content(response, "text", encoding = "UTF-8"), flatten = TRUE)
      if (length(data) == 0) return(NULL)
      df <- as.data.frame(data)
      Sys.sleep(1)
      return(df)
    } else {
      warning(paste("Błąd HTTP", status_code(response), "dla kraju", country, "rok", year))
      return(NULL)
    }
  }, error = function(e) {
    warning(paste("Błąd połączenia dla", country, year, ":", e$message))
    return(NULL)
  })
}

# Pobranie danych: dla każdego kraju i roku
all_data <- map_dfr(eu_countries, function(country) {
  map_dfr(start_year:end_year, function(year) {
    get_beef_data_for_country_year(country, year)
  })
})

# Eksport do pliku
write_csv(all_data, "ceny_wolowiny_Cows_UE_2004_teraz.csv")
cat("✅ Zapisano dane do ceny_wolowiny_Cows_UE_2004_teraz.csv\n")
