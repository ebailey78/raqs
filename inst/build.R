source("./inst/scrape.R")

data <- scrape()

services <- data$services

for(s in seq(nrow(services))) {

  service <- services$Service[s]
  endpoints <- data$endpoints[data$endpoints$Service == service, ]
  if(nrow(endpoints) == 0) {
    service <- gsub("QA", "Quality Assurance", service)
    service <- gsub("QC", "Quality control", service)
    service <- unique(data$endpoints$Service[agrep(service, data$endpoints$Service)])
    if(length(service) != 1) {
      stop("Could not identify service: ", services$Service[s])
    } else {
      warning("Matched Service `", services$Service[s], "` with `", service, "`", call. = FALSE)
      endpoints <- data$endpoints[data$endpoints$Service == service, ]
    }
  }

  file_name <- tolower(gsub(" ", "_", services$Service[s]))

  title <- glue::glue("#' {services$Service[s]}")
  description <- glue::glue("#' {services$Description[s]}")
  name <- glue::glue("#'@name {file_name}")

  x <- c(endpoints$`Required Variables`, endpoints$`Optional Variables`)
  x <- unique(unlist(strsplit(x, "|", fixed = TRUE)))
  params <- data$variables[data$variables$Variable %in% x, ]
  if(nrow(params) > 0) {
    params <- sapply(seq(nrow(params)), function(i) {
      glue::glue("#'@param {params$Variable[i]} {params$Description[i]}")
    })
    params <- gsub("[[:space:]]+", " ", params)
  } else {
    params <- NULL
  }

  doc <- c(title, "#'", description, "#'", params, "#'", name, "NULL")

  for(f in seq(nrow(endpoints))) {

    endpoint <- as.list(endpoints[f, ])
    fn <- snakecase::to_snake_case(endpoint$Endpoint)
    args <- unlist(strsplit(c(endpoint$`Required Variables`, endpoint$`Optional Variables`), "|", fixed = TRUE))
    if(length(args) > 0) {
      func_call <- glue::glue("\tgetAQS(\"{endpoint$Endpoint}\", {paste(args, args, sep = ' = ', collapse = ', ')}, auth = {endpoint$`Auth Required`})")
    } else {
      func_call <- glue::glue("\tgetAQS(\"{endpoint$Endpoint}\", auth = {endpoint$`Auth Required`})")
    }
    func <- c(glue::glue("{fn} <- function({paste(args, collapse = ', ')}) {{"), func_call, "}")
    func_doc <- c(glue::glue("#'@rdname {file_name}"), "#'@export")

    doc <- c(doc, "", func_doc, func)

  }

  doc <- c(doc, "")

  writeLines(doc, con = glue::glue("./R/{file_name}.R"))

}
