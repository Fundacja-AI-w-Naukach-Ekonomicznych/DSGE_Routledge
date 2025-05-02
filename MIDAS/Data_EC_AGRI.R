library(httr)
library(tidyverse)
library(readr)

# https://agridata.ec.europa.eu/extensions/DataPortal/API_Documentation.html

file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")

create_API_links <- function(endpoint, params_list) {
  # Wybór krajów
  eu_countries <- c("AT","BE","BG","HR","CY","CZ","DK","EE","FI","FR","DE","EL",
                    "HU","IE","IT","LV","LT","LU","MT","NL","PL","PT","RO","SK","SI","ES","SE")
  
  url_list <- c()  # pusty wektor na URL-e
  
  for (country in eu_countries) {
    params <- list(
      memberStateCodes = country,
      beginDate = "01/01/2004"
    )
    params <- c(params, params_list)
    
    url <- modify_url(
      paste0("https://www.ec.europa.eu/agrifood/api/", endpoint, "/prices"),
      query = params
    )
    url_list <- c(url_list, url)
  }
  
  return(url_list)
}

download_data_EC_AGRI <- function(URL) {
  response <- GET(URL)
  print(URL)
  
  if (status_code(response) == 200) {
    data <- fromJSON(content(response, "text", encoding = "UTF-8"), flatten = TRUE)
    if (length(data) == 0) return(NULL)
    df <- as.data.frame(data)
    Sys.sleep(1)
    return(df)
  } 
}

bulk_download_EU_Countries <- function(url_links, output_file){
  
  all_data <- data.frame()
  
  for (url in url_links) {
    data <- download_data_EC_AGRI(url)
    if (!is.null(data)) {
      all_data <- rbind(all_data, data)
    }
    
    Sys.sleep(3)  # Opóźnienie między żądaniami
  }
  
  # Zapisz dane do pliku CSV
  write_csv(all_data, output_file)
  
  return(all_data)  
}

download_script<- function(){
  dane <- list(
    list(endpoint = "beef", params = list(categories="cows"), out_file_name = "EU_Cows.csv"),
    list(endpoint = "pigmeat", params = list(categories="pigs"), out_file_name = "EU_Pigs.csv"),
    list(endpoint = "poultry", params = list(categories="broilers"), out_file_name = "EU_Poultry.csv"),
    list(endpoint = "poultry/egg", params = list(categories="poultry"), out_file_name = "EU_Eggs.csv"),
    list(endpoint = "sheepAndGoat", params = list(categories="sheepAndGoat"), out_file_name = "EU_SheepAndGoat.csv"),
    list(endpoint = "dairy", params = list(categories="dairy"), out_file_name = "EU_Dairy.csv"),
    list(endpoint = "fruitAndVegetable", params = list(categories="fruitAndVegetable"), out_file_name = "EU_FruitAndVegetable.csv"),
    list(endpoint = "cereal", params = list(categories="cereal"), out_file_name = "EU_Cereal.csv"),
    list(endpoint = "oilseeds", params = list(categories="oilseeds"), out_file_name = "EU_Oilseeds.csv"),
    list(endpoint = "wine", params = list(categories="wine"), out_file_name = "EU_Wine.csv")
  )

  for (element in dane) {
    print(paste("Pobieranie danych dla:", element$endpoint))
    links <- create_API_links(element$endpoint, element$params)

    bulk_download_EU_Countries(links, paste0(file_path, element$out_file_name))
    
  }
  
}

download_script()

}

