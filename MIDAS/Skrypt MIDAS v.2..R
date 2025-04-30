# ----------------------------------
# INSTALACJA I ŁADOWANIE PAKIETÓW
# ----------------------------------
if (!require(eurostat)) install.packages("eurostat")
if (!require(ecb)) install.packages("ecb")
if (!require(quantmod)) install.packages("quantmod")
if (!require(dplyr)) install.packages("dplyr")
if (!require(tidyr)) install.packages("tidyr")
if (!require(purrr)) install.packages("purrr")
if (!require(lubridate)) install.packages("lubridate")

library(eurostat)
library(ecb)
library(quantmod)
library(dplyr)
library(tidyr)
library(purrr)
library(lubridate)

# ----------------------------------
# PARAMETRY
# ----------------------------------
start_data <- "2000-01-01"
end_data <- Sys.Date()

# ----------------------------------
# INFLACJA (Eurostat, miesięczna)
# ----------------------------------
kraje_ue <- c("AT", "BE", "BG", "HR", "CY", "CZ", "DK", "EE", "FI", "FR",
              "DE", "GR", "HU", "IE", "IT", "LV", "LT", "LU", "MT", "NL",
              "PL", "PT", "RO", "SK", "SI", "ES", "SE")

hicp_indeks_2015_100 <- get_eurostat(
  id = "prc_hicp_midx",
  filters = list(geo = kraje_ue, coicop = "CP00", unit = "I15"),
  time_format = "date"
) %>%
  filter(time >= as.Date(start_data))

# ----------------------------------
# KURSY WALUTOWE (EBC, dzienne)
# ----------------------------------
pobierz_kurs_ecb <- function(waluta) {
  key <- paste0("EXR.D.", waluta, ".EUR.SP00.A")
  dane <- get_data(key, list(
    startPeriod = format(as.Date(start_data), "%Y-%m-%d"),
    endPeriod = format(as.Date(end_data), "%Y-%m-%d"),
    detail = "full"
  ))
  dane$obstime <- as.Date(dane$obstime)
  dane %>%
    select(obstime, obsvalue) %>%
    rename(Data = obstime, !!paste0("EUR_", waluta) := obsvalue)
}

waluty <- c("USD", "JPY", "GBP", "CHF", "CNY")
lista_kursow <- map(waluty, pobierz_kurs_ecb)
kursy_walut <- reduce(lista_kursow, full_join, by = "Data") %>% arrange(Data)

# ----------------------------------
# STOPY PROCENTOWE (EBC, dzienne)
# ----------------------------------
pobierz_stope_ecb <- function(klucz, nazwa_stopy) {
  dane <- get_data(klucz, list(
    startPeriod = format(as.Date(start_data), "%Y-%m-%d"),
    endPeriod = format(as.Date(end_data), "%Y-%m-%d"),
    detail = "full"
  ))
  dane$obstime <- as.Date(dane$obstime)
  dane %>%
    select(obstime, obsvalue) %>%
    rename(Data = obstime, !!nazwa_stopy := obsvalue)
}

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

stopy_ecb <- reduce(lista_stop, full_join, by = "Data") %>% arrange(Data)

# ----------------------------------
# INDEKSY GIEŁDOWE (Yahoo Finance, dzienne)
# ----------------------------------
indeksy_ue27 <- c(
  AT = "^ATX", DK = "^OMXC20", FI = "^OMXH25", FR = "^FCHI", DE = "^GDAXI",
  HU = "^BUX", IT = "FTSEMIB.MI", NL = "^AEX", PL = "^WIG20", PT = "^PSI20",
  ES = "^IBEX", SE = "^OMXS30"
)

dane_indeksy <- list()

for (kraj in names(indeksy_ue27)) {
  symbol <- indeksy_ue27[[kraj]]
  message("📥 Pobieranie danych dla: ", kraj, " (", symbol, ")")
  tryCatch({
    xts_tmp <- getSymbols(symbol, src = "yahoo", from = start_data, auto.assign = FALSE)
    if (!is.null(xts_tmp) && nrow(xts_tmp) > 0) {
      dane_indeksy[[kraj]] <- xts_tmp
    }
  }, error = function(e) {
    message("❌ Błąd dla ", kraj, ": ", e$message)
  })
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
message("📥 Pobieranie danych o aktywach EBC (ECBASSETSW)")

getSymbols("ECBASSETSW", src = "FRED", from = start_data)

central_bank_assets <- data.frame(
  Data = index(ECBASSETSW),
  ECB_Assets_Mln_USD = coredata(ECBASSETSW)
) %>%
  filter(!is.na(ECB_Assets_Mln_USD)) %>%
  arrange(Data)

# ----------------------------------
# PODGLĄD DANYCH
# ----------------------------------
cat("\n✅ Inflacja HICP (Eurostat):\n")
print(head(hicp_indeks_2015_100))

cat("\n✅ Kursy walutowe EUR/XXX (EBC):\n")
print(head(kursy_walut))

cat("\n✅ Stopy procentowe (EBC):\n")
print(head(stopy_ecb))

cat("\n✅ Indeksy giełdowe (Yahoo, dzienne):\n")
print(head(indeksy_dzienne))

cat("\n✅ Cena ropy Brent (FRED, dzienna):\n")
print(head(ropa_brent_dzienna))

cat("\n✅ Central Bank Assets for Euro Area (FRED, tygodniowe):\n")
print(head(central_bank_assets))
