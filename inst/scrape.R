library(rvest)

clear_whitespace <- function(x) {
  if(inherits(x, "data.frame")) {
    for(c in seq(ncol(x))) {
      x[, c] <- clear_whitespace(x[, c])
    }
  } else {
    x <- gsub("[[:space:]]+", " ", x)
  }
  return(x)
}

clean_args <- function(args) {
  args <- trimws(strsplit(args, ",")[[1]])
  if(all(c("email", "key") %in% args)) {
    args <- args[!args %in% c("email", "key")]
  }
  args <- gsub("[[:punct:]]", "", args)
  args <- paste(args, collapse = "|")
  return(args)
}

scrape <- function(url = "./inst/aqs.html") {

  #url <- "https://aqs.epa.gov/aqsweb/documents/data_api.html"

  webpage <- xml2::read_html(url)

  services <- clear_whitespace(rvest::html_table(rvest::html_nodes(webpage, "table.webservices"))[[1]])
  variables <- clear_whitespace(rvest::html_table(rvest::html_nodes(webpage, "table.variables"))[[1]])
  endpoints <- rvest::html_nodes(webpage, "table.examples")

  x <- data.frame()

  for(e in seq(length(endpoints))) {

    try({
      tbl <- endpoints[[e]]
      tbl <- rvest::html_table(tbl, fill = TRUE, trim = TRUE)
      tbl1 <- tbl[seq(1,nrow(tbl), by = 2), ]
      tbl2 <- tbl[seq(2,nrow(tbl), by = 2), ]
      x <- rbind(x, tbl1)
    })

  }

  endpoints <- clear_whitespace(x)
  endpoints$`Auth Required` <- grepl("key", endpoints$`Required Variables`)
  for(r in seq(nrow(endpoints))) {
    endpoints$`Required Variables`[r] <- clean_args(endpoints$`Required Variables`[r])
    endpoints$`Optional Variables`[r] <- clean_args(endpoints$`Optional Variables`[r])
  }

  return(list(
    services = services,
    variables = variables,
    endpoints = endpoints
  ))

}
