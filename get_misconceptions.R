# Dependencies ----
library(httr2)
library(rvest)
library(dplyr)
library(stringr)
library(rio)

# Make request ----
req <- request("https://en.wikipedia.org/wiki/List_of_common_misconceptions") |>
  req_cache("Cache")
res <- req |>
  req_perform()
# Filter misconceptions ----
## Get list items in unordered lists in the article content
misconceptions <- res |>
    resp_body_html() |>
    html_elements("#mw-content-text ul li")
## Filter out list items that contain a cite element
misconceptions <- misconceptions[misconceptions |>
  lapply(X = _, \(e) {
    chld <- html_children(e)
    if (length(chld) > 1) {
      return(html_name(chld[2]) != "cite")
    } else {
      return(TRUE)
    }
  }) |> unlist()]
## Get text from elements
misconceptions <- misconceptions |>
    html_text() |> stringr::str_trim()
## Remove further reading links etc.
misconceptions <- misconceptions[str_length(misconceptions) >= 20]
misconceptions <- misconceptions[!str_detect(misconceptions, "List of ")]
misconceptions <- misconceptions[!misconceptions %in% c("Legends and myths regarding the Titanic", "Outline of public relations", "Pseudodoxia Epidemica", "Superseded theories in science", "Misconceptions taught by science textbooks")]

# Write misconceptions to file ----
export(data.frame(misconception = misconceptions), "misconceptions.csv")
