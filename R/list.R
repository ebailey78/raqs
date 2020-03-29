#' List
#'
#' Provides information you need to construct other queries. Valid values for the required variables: parameter code, state code, etc. (See below.)
#'
#'@param state The 2 digit state FIPS code for the state (with leading zero). They may be obtained via the list states service. Only data from within this state will be returned.
#'@param county The 3 digit state FIPS code for the county within the state (with leading zeroes). They may be obtained via the list counties service. Only data from within this county will be returned.
#'@param pc The AQS parameter class name. Classes are a way to group like parameters. They may be obtained via the list classes service. Only used in the list parameters service.
#'
#'@name list
NULL

#'@rdname list
#'@export
list_states <- function() {
	getAQS("list/states", auth = TRUE)
}

#'@rdname list
#'@export
list_counties_by_state <- function(state) {
	getAQS("list/countiesByState", state = state, auth = TRUE)
}

#'@rdname list
#'@export
list_sites_by_county <- function(state, county) {
	getAQS("list/sitesByCounty", state = state, county = county, auth = TRUE)
}

#'@rdname list
#'@export
list_cbsas <- function() {
	getAQS("list/cbsas", auth = TRUE)
}

#'@rdname list
#'@export
list_classes <- function() {
	getAQS("list/classes", auth = TRUE)
}

#'@rdname list
#'@export
list_parameters_by_class <- function(pc) {
	getAQS("list/parametersByClass", pc = pc, auth = TRUE)
}

#'@rdname list
#'@export
list_pqaos <- function() {
	getAQS("list/pqaos", auth = TRUE)
}

#'@rdname list
#'@export
list_mas <- function() {
	getAQS("list/mas", auth = TRUE)
}

