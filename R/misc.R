base_url <- "https://aqs.epa.gov/data/api/"
settingsPath <- "~/raqs.rda"

.onAttach <- function(...) {


  if(file.exists(settingsPath)) {
    load(settingsPath)
    options(raqsSettings = aqsSettings)
    # if(!isAvailable()) {
    #   warning("The AQS system is currently unavailable.", call. = FALSE)
    # }
  } else {
    packageStartupMessage("\nU.S. EPA's Air Quality System requires free registration. Please use the\n\n",
            "   signup() function to register if you haven't already.\n\n",
            "Once registered use\n\n",
            "   setAQSUser()\n\n",
            "to set your username and password for use with raqdm.")
  }

}

getAQS <- function(endpoint, ..., auth = FALSE) {

  query <- list(...)

  if(auth == TRUE) {
    settings <- getOption("raqsSettings")
    if(is.null(settings)) {
      stop("You must use `setAQSUser()` to set your credentials for AQS.", call. = FALSE)
    }
    query$email <- getOption("raqsSettings")$email
    query$key <- getOption("raqsSettings")$key
  }

  url <- paste0(base_url, endpoint)

  response <- httr::GET(url, query = query)

  return(jsonlite::fromJSON(httr::content(response, as = "text"))$Data)

}


