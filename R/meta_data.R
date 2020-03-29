#' Meta Data
#'
#' Returns information about the API. Is it available/up? What are the meanings of the fields in my returned data? Recent and planned changes, etc.
#'
#'
#'@name meta_data
NULL

#'@rdname meta_data
#'@export
meta_data_is_available <- function() {
	getAQS("metaData/isAvailable", auth = FALSE)
}

#'@rdname meta_data
#'@export
meta_data_fields_by_service <- function() {
	getAQS("metaData/fieldsByService", auth = TRUE)
}

#'@rdname meta_data
#'@export
meta_data_fields_by_service <- function(service) {
	getAQS("metaData/fieldsByService", service = service, auth = TRUE)
}

#'@rdname meta_data
#'@export
meta_data_issues <- function() {
	getAQS("metaData/issues", auth = TRUE)
}

