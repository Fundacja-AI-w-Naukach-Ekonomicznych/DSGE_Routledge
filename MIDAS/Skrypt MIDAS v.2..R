# ----------------------------------
# INSTALACJA I ŁADOWANIE PAKIETÓW
# ----------------------------------
if (!require(eurostat)) install.packages("eurostat")
if (!require(ecb)) install.packages("ecb")
if (!require(quantmod)) install.packages("quantmod")

library(eurostat)
library(ecb)
library(quantmod)
library(tidyverse)

# ----------------------------------
# PARAMETRY
# ----------------------------------
start_data <- "2000-01-01"

# ----------------------------------
# INFLACJA (Eurostat, miesięczna)
# ----------------------------------
kraje_ue <- c("AT", "BE", "BG", "HR", "CY", "CZ", "DK", "EE", "FI", "FR",
              "DE", "GR", "HU", "IE", "IT", "LV", "LT", "LU", "MT", "NL",
              "PL", "PT", "RO", "SK", "SI", "ES", "SE")

hicp_indeks_2015_100 <- get_eurostat(
  id = "prc_hicp_midx",
  filters = list(geo = kraje_ue, coicop = "CP00", unit = "I15")) %>%
  filter(time >= as.Date(start_data)) |>
  select(geo, time, values) |>
  tidyr::pivot_wider(names_from = geo, 
                     names_prefix = "HICP_", 
                     values_from = values) 
  
# ----------------------------------
# KURSY WALUTOWE (EBC, dzienne)
# ----------------------------------
download_ECB_FX_rates <- function(currency, start_date) {
  key <- paste0("EXR.D.", currency, ".EUR.SP00.A")
  df <- ecb::get_data(key, filter = list(
    startPeriod = format(as.Date(start_data), "%Y-%m-%d"))) |>
    mutate(obstime = as.Date(obstime)) |>
    select(obstime, obsvalue) %>%
    rename(Data = obstime, !!paste0("EUR_", currency) := obsvalue)
  return(df)
}

bulk_download_FX_rates <- function(start_date){
  waluty <- c("USD", "JPY", "GBP", "CHF", "CNY")
  lista_kursow <- map(waluty, ~download_ECB_FX_rates(.x, start_date))
  kursy_walut <- reduce(lista_kursow, full_join, by = "Data") %>%
    arrange(Data)
  return(kursy_walut)
} 

df_final <- bulk_download_FX_rates(start_date)

# ----------------------------------
# STOPY PROCENTOWE (EBC, dzienne)
# ----------------------------------
pobierz_stope_ecb <- function(klucz, nazwa_stopy) {
  dane <- ecb::get_data(klucz, list(
    startPeriod = format(as.Date(start_data), "%Y-%m-%d"))) %>%
    mutate(obstime = as.Date(obstime)) %>%
    select(obstime, obsvalue) %>%
    rename(Data = obstime, !!nazwa_stopy := obsvalue)
  
    return(dane)
}

bulk_download_ECB_rates <- function(){ 
  klucze_stopy <- list(
    MRO = "FM.D.U2.EUR.4F.KR.MRR_FR.LEV",
    Marginal = "FM.D.U2.EUR.4F.KR.MLFR.LEV",
    Deposit = "FM.D.U2.EUR.4F.KR.DFR.LEV"
  )
  
  lista_stop <- list(
    pobierz_stope_ecb(klucze_stopy$MRO, "MRO"),
    pobierz_stope_ecb(klucze_stopy$Marginal, "Marginal"),
    pobierz_stope_ecb(klucze_stopy$Deposit, "Deposit")
  )
  
  stopy_ecb <- reduce(lista_stop, full_join, by = "Data") %>% 
    arrange(Data)
  return(stopy_ecb)
}

ECB_rates <- bulk_download_ECB_rates()
df_final <- df_final %>% left_join(ECB_rates, by = "Data") %>%
  arrange(Data)
rm(ECB_rates)

# ----------------------------------
# INDEKSY GIEŁDOWE (Yahoo Finance, dzienne)
# ----------------------------------
indeksy_ue27 <- c(
  AT = "^ATX", DK = "^OMXC20", FI = "^OMXH25", 
  FR = "^FCHI", DE = "^GDAXI", HU = "^BUX", 
  IT = "FTSEMIB.MI", NL = "^AEX", PL = "^WIG20", 
  PT = "^PSI20", ES = "^IBEX", SE = "^OMXS30"
)

dane_indeksy <- list()

for (kraj in names(indeksy_ue27)) {
  symbol <- indeksy_ue27[[kraj]]
  xts_tmp <- getSymbols(symbol, src = "yahoo", 
                        from = start_data, auto.assign = FALSE)
  if (!is.null(xts_tmp) && nrow(xts_tmp) > 0) {
    dane_indeksy[[kraj]] <- xts_tmp
    Sys.sleep(5)
  }
}

indeksy_dzienne <- imap_dfr(dane_indeksy, function(xts_obj, kraj) {
  data.frame(
    Data = as.Date(index(xts_obj)),
    Indeks = as.numeric(Cl(xts_obj)),
    Kraj = kraj
  )
})

# ----------------------------------
# CENA ROPY BRENT (FRED, dzienne)
# ----------------------------------
message("📥 Pobieranie danych o cenie ropy Brent (DCOILBRENTEU)")

getSymbols("DCOILBRENTEU", src = "FRED", from = start_data)

ropa_brent_dzienna <- data.frame(
  Data = index(DCOILBRENTEU),
  Cena_Brent_USD = coredata(DCOILBRENTEU)
) %>%
  filter(!is.na(Cena_Brent_USD)) %>%
  arrange(Data)

# ----------------------------------
# AKTYWA EBC - Central Bank Assets for Euro Area (FRED, tygodniowe)
# ----------------------------------
getSymbols("ECBASSETSW", src = "FRED", from = start_data)

central_bank_assets <- data.frame(
  Data = index(ECBASSETSW),
  ECB_Assets_Mln_USD = coredata(ECBASSETSW)
) %>%
  filter(!is.na(ECB_Assets_Mln_USD)) %>%
  arrange(Data)
