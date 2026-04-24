####
# auxiliary functions ----
###
pipe <- ## piping funcions ----
  purrr::compose |>
  purrr::partial(.dir = "forward")
#
safe.get <- ## getting urls without breaking ----
  httr2::request |>
  pipe(httr2::req_perform) |>
  purrr::safely()
#
not.found <- ## check if url exists ----
  RCurl::url.exists |>
  purrr::negate()
#
test.url <- ## tests url and stop if wrong ----
  function(url)
    if (url |> not.found())
      stop_portal_structure_change(url)
#
string <- ## returns a constant string ----
  function(val) {function() {val}}
#
stop_portal_structure_change <-  ## stop when things go south ----
  function(url)
    paste0(
      "Tried to access the TSE's Open Data Portal,\n",
      "but there was a change in some of its urls.\n",
      "Tried to access <", url, ">,\n",
      "but received error:\n",
      "> ", safe.get(url)$error$message, "\n",
      "Please, write to CONRE3 at info@conre3.org.br\n",
      "with the subject 'Package {electpollBR} needs updates'\n",
      "and present this error message.\n\n"
    ) |>
      stop(call. = FALSE)

####
# main urls ----
###
tse.main.page.url <-
  string("https://dadosabertos.tse.jus.br/")
#
group.url <-
  string("https://dadosabertos.tse.jus.br/group/")
#
electoral.polls.url <-
  string("https://dadosabertos.tse.jus.br/group/pesquisas-eleitorais")

####
# test TSE urls ----
###
test.mains.urls <- function() {
  tse.main.page.url() |> test.url()
  group.url() |> test.url()
  electoral.polls.url() |> test.url()
}

####
# scrape portal for datasets ----
###
scrape.for.dataset.urls <- function() {
  # TODO
}

####
# list availables datasets ----
###
list.available.datasets <- function() {
  # TODO
}

####
# compare available datasets ----
###
compare.with.already.known <- function() {
  # TODO
}
#
compare.with.what.should.there.be <- function() {
  # TODO
}
