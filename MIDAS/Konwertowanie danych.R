library(dplyr)
library(readr)
library(tidyr)
library(stringr)
library(lubridate)

# Ścieżka do katalogu, w którym znajduje się skrypt
file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path), "/")

# Lista plików CSV
csv_files <- list.files(path = file_path, pattern = "\\.csv$", full.names = TRUE)

# Wczytanie danych do listy
dane_lista <- lapply(csv_files, read_csv)
names(dane_lista) <- tools::file_path_sans_ext(basename(csv_files))

# =====================
# PRZETWARZANIE PLIKÓW
# =====================

przetworzone <- list()

# === 1. WINE ===
wine_files <- c("EU_Wine")

for (nazwa in wine_files) {
  df <- dane_lista[[nazwa]]
  
  wine_clean <- df %>%
    mutate(
      begin_date = dmy(beginDate),
      end_date = dmy(endDate),
      value = as.numeric(str_replace(price, "€", "")),
      description_clean = str_replace_all(description, "[^A-Za-z0-9]+", "_"),
      variable = paste0("wine_", description_clean, "_", memberStateCode)
    ) %>%
    select(begin_date, end_date, variable, value) %>%
    pivot_wider(
      names_from = variable,
      values_from = value,
      values_fn = mean
    )
  
  przetworzone[[nazwa]] <- wine_clean
}

# === 2. OILSEEDS ===
oilseeds <- dane_lista[["EU_Oilseeds"]]

oilseeds_clean <- oilseeds %>%
  mutate(
    begin_date = dmy(beginDate),
    end_date = dmy(endDate),
    value = as.numeric(str_replace(price, "€", "")),
    product_clean = str_replace_all(product, "[^A-Za-z0-9]+", "_"),
    type_clean = str_replace_all(productType, "[^A-Za-z0-9]+", "_"),
    variable = paste0("Oilseeds_", product_clean, "_", type_clean, "_", memberStateCode)
  ) %>%
  select(begin_date, end_date, variable, value) %>%
  pivot_wider(
    names_from = variable,
    values_from = value,
    values_fn = mean
  )

przetworzone[["EU_Oilseeds"]] <- oilseeds_clean

# === 3. CEREAL ===
cereal <- dane_lista[["EU_Cereal"]]

cereal_clean <- cereal %>%
  mutate(
    begin_date = dmy(beginDate),
    end_date = dmy(endDate),
    value = as.numeric(str_replace(price, "€", "")),
    product_clean = str_replace_all(productName, "[^A-Za-z0-9]+", "_"),
    variable = paste0("cereal_", product_clean, "_", memberStateCode)
  ) %>%
  select(begin_date, end_date, variable, value) %>%
  pivot_wider(
    names_from = variable,
    values_from = value,
    values_fn = mean
  )

przetworzone[["EU_Cereal"]] <- cereal_clean

# === 4. FRUIT & VEGETABLE ===
fnv <- dane_lista[["EU_FruitAndVegetable"]]

fnv_clean <- fnv %>%
  mutate(
    begin_date = dmy(beginDate),
    end_date = dmy(endDate),
    value = as.numeric(str_replace(price, "€", "")),
    variety_clean = str_replace_all(variety, "[^A-Za-z0-9]+", "_"),
    variable = paste0("FnV_", variety_clean, "_", memberStateCode)
  ) %>%
  select(begin_date, end_date, variable, value) %>%
  pivot_wider(
    names_from = variable,
    values_from = value,
    values_fn = mean
  )

przetworzone[["EU_FruitAndVegetable"]] <- fnv_clean

# === 5. DAIRY ===
dairy <- dane_lista[["EU_Dairy"]]

dairy_clean <- dairy %>%
  mutate(
    begin_date = dmy(beginDate),
    end_date = dmy(endDate),
    value = as.numeric(str_replace(price, "€", "")),
    product_clean = str_replace_all(product, "[^A-Za-z0-9]+", "_"),
    variable = paste0("Dairy_", product_clean, "_", memberStateCode)
  ) %>%
  select(begin_date, end_date, variable, value) %>%
  pivot_wider(
    names_from = variable,
    values_from = value,
    values_fn = mean
  )

przetworzone[["EU_Dairy"]] <- dairy_clean

# === 6. SHEEP & GOAT ===
sng <- dane_lista[["EU_SheepAndGoat"]]

sng_clean <- sng %>%
  mutate(
    begin_date = dmy(beginDate),
    end_date = dmy(endDate),
    value = as.numeric(str_replace(price, "€", "")),
    category_clean = str_replace_all(category, "[^A-Za-z0-9]+", "_"),
    variable = paste0("SnG_", category_clean, "_", memberStateCode)
  ) %>%
  select(begin_date, end_date, variable, value) %>%
  pivot_wider(
    names_from = variable,
    values_from = value,
    values_fn = mean
  )

przetworzone[["EU_SheepAndGoat"]] <- sng_clean

# === 7. EGGS ===
eggs <- dane_lista[["EU_Eggs"]]

eggs_clean <- eggs %>%
  mutate(
    begin_date = dmy(beginDate),
    end_date = dmy(endDate),
    value = as.numeric(str_replace(price, "€", "")),
    method_clean = str_replace_all(farmingMethod, "[^A-Za-z0-9]+", "_"),
    variable = paste0("Eggs_", method_clean, "_", memberStateCode)
  ) %>%
  select(begin_date, end_date, variable, value) %>%
  pivot_wider(
    names_from = variable,
    values_from = value,
    values_fn = mean
  )

przetworzone[["EU_Eggs"]] <- eggs_clean

# === 8. POULTRY ===
poultry <- dane_lista[["EU_Poultry"]]

poultry_clean <- poultry %>%
  mutate(
    begin_date = dmy(beginDate),
    end_date = dmy(endDate),
    value = as.numeric(str_replace(price, "€", "")),
    product_clean = str_replace_all(productName, "[^A-Za-z0-9]+", "_"),
    variable = paste0("Poultry_", product_clean, "_", memberStateCode)
  ) %>%
  select(begin_date, end_date, variable, value) %>%
  pivot_wider(
    names_from = variable,
    values_from = value,
    values_fn = mean
  )

przetworzone[["EU_Poultry"]] <- poultry_clean

# === 9. PIGS ===
pigs <- dane_lista[["EU_PIGS"]]

pigs_clean <- pigs %>%
  mutate(
    begin_date = dmy(beginDate),
    end_date = dmy(endDate),
    value = as.numeric(str_replace(price, "€", "")),
    class_clean = str_replace_all(pigClass, "[^A-Za-z0-9]+", "_"),
    variable = paste0("Pigs_", class_clean, "_", memberStateCode)
  ) %>%
  select(begin_date, end_date, variable, value) %>%
  pivot_wider(
    names_from = variable,
    values_from = value,
    values_fn = mean
  )

przetworzone[["EU_PIGS"]] <- pigs_clean

# === 10. COWS ===
cows <- dane_lista[["EU_Cows"]]

cows_clean <- cows %>%
  mutate(
    begin_date = dmy(beginDate),
    end_date = dmy(endDate),
    value = as.numeric(str_replace(price, "€", "")),
    productcode_clean = str_replace_all(productCode, "[^A-Za-z0-9]+", "_"),
    variable = paste0("Cows_", productcode_clean, "_", memberStateCode)
  ) %>%
  select(begin_date, end_date, variable, value) %>%
  pivot_wider(
    names_from = variable,
    values_from = value,
    values_fn = mean
  )

przetworzone[["EU_Cows"]] <- cows_clean


# =====================
# ŁĄCZENIE W JEDEN DATAFRAME
# =====================
df_zbiorczy <- reduce(przetworzone, full_join, by = c("begin_date", "end_date"))

# Podgląd wyniku
glimpse(df_zbiorczy)
