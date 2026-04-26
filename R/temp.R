####
# temporary script to download and treat 2026 data already
###

# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026
#
# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026/resource/769a663e-12c5-489e-a9c8-04633c2d57a3
# https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/pesquisa_eleitoral_2026.zip
#
# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026/resource/5675d403-63ce-4a39-bd00-fc110ef999a7
# https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/pesquisa_contratante_2026.zip
#
# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026/resource/32fc58de-8369-4b9f-9c97-1647f8de49cb
# https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/pesquisa_pagante_2026.zip
#
# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026/resource/7d83679f-c252-493b-98ad-e532c7fa7252
# https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/nota_fiscal_2026.zip
#
# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026/resource/e2520f5b-c7c9-453f-9f4a-2a96214570a0
# https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/questionario_pesquisa_2026.zip
#
# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026/resource/fc6b7e48-540d-4f94-a412-8829d5f022d3
# https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/bairro_municipio_2026.zip

# download everything ----

## verify whether or not the ZIP files are up-to-date ----
### "Is this trip really necessary?"

### naming stuff ----
url.base <- "https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/"
datasets.urls <-
  c(
    "pesquisa_eleitoral",
    "pesquisa_contratante",
    "pesquisa_pagante",
    "nota_fiscal",
    "questionario_pesquisa",
    "bairro_municipio"
  )
datasets.names <-
  c(
    "poll",
    "contractor",
    "payer",
    "invoice",
    "questionnaire",
    "detail"
  )
year <- 2026 |> as.character()
zipfile.extension <- ".zip"
zipfile.urls <-
  paste0(url.base, datasets.urls, "_", year, zipfile.extension) |>
  setNames(datasets.names)
timestampfile.path <- "data/zip-timestamp.json"
download.path.base <- "data/zip/"
zipfiles.download.names <-
  paste0(
    download.path.base,
    datasets.urls,
    "_",
    year,
    zipfile.extension
  )
csvfiles.path <- "data/csv"

### get current zip files' timestamps ----
current <-
  zipfile.urls |>
  lapply(
    function(url) {
      httr2::request(url) |>
        httr2::req_method("HEAD") |>
        httr2::req_perform() |>
        httr2::resp_headers() |>
        purrr::pluck("Last-Modified") |>
        lubridate::dmy_hms(tz = "")
    }
  ) |>
  jsonlite::toJSON() |>  # just to get rid of the trailing "GMT" in the dates
  jsonlite::fromJSON()

### load already downloaded zip files' timestamps if any ----
previous <-
  if (file.exists(timestampfile.path))
    jsonlite::read_json(timestampfile.path, simplifyVector = TRUE) else 0

### check if not up-to-date ----
zipfile.outdated <- unlist(current) != unlist(previous)

#### SAFETY LOCK: 2 files are way too heavy to download them just for fun ----
zipfile.outdated <- zipfile.outdated & c(T,T,T,T,F,F)
zipfile.outdated <- c(T,T,T,T,F,F)

### download outdated zip files if any ----
if (any(zipfile.outdated)) {
  zipfile.urls[zipfile.outdated] |>
    lapply(
      \(u)
      httr2::request(u) |>
        httr2::req_throttle(capacity = 10, fill_time_s = 60)
    ) |>
    httr2::req_perform_parallel(
      paths = zipfiles.download.names[zipfile.outdated],
      on_error = "continue",
      progress = TRUE,
      max_active = 4
    )
}

### save current zip files' timestamps ----
jsonlite::write_json(current, timestampfile.path, auto_unbox = TRUE)

# unpack downloaded files ----
## unpacking CSVs first ----
### extracting only *_BRASIL.csv, for it has all states' records at once
zipfiles.download.names[1:3] |>
  purrr::walk(
    \(z)
      unzip(
        z,
        files =
          unzip(z, list = TRUE)$Name |>
          stringr::str_subset(pattern = "BRASIL"),
        exdir = csvfiles.path
      )
  )

## ?unpack PDFs? ----
### or should I just: ----
### - unpack one PDF at a time,
### - pass it through tesseract,
### - extract relevant info from each PDF, and
### - mount a dataframe?
### perhaps the invoice PFDs will be the only needed to pass through tesseract
# TODO

# importing CSVs ----
polls <-
  "data/csv/pesquisa_eleitoral_2026_BRASIL.csv" |>
  readr::read_csv2(
    locale =
      readr::locale(
        encoding = "ISO-8859-1",
        asciify = FALSE
      )
  )
contractors <-
  "data/csv/pesquisa_contratante_2026_BRASIL.csv" |>
  readr::read_csv2(
    locale =
      readr::locale(
        encoding = "ISO-8859-1",
        asciify = FALSE
      )
  )
payers <-
  "data/csv/pesquisa_pagante_2026_BRASIL.csv" |>
  readr::read_csv2(
    locale =
      readr::locale(
        encoding = "ISO-8859-1",
        asciify = FALSE
      )
  )

# tidy up CSVs ----

## joining polls, contractors, and invoices ----
# TODO
