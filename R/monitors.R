#' Monitors
#'
#' Returns operational information about the samplers (monitors) used to collect the data. Includes identifying information, operational dates, operating organizations, etc.
#'
#'@param bdate The begin date of the data selection in YYYYMMDD format. Only data on or after this date will be returned. (Note, for annual data, only the year portion of the bdate and edate are used and only whole years of data are returned. For example, bdate = 20171231 and edate = 20180101 will return full data for 2017 and 2018.)
#'@param edate The end date of the data selection in YYYYMMDD format. Only data on or before this date will be returned. The end date must be in the same year as the begin date. This rule does not apply to the Monitors service. (Note, for annual data, only the year portion of the bdate and edate are used and only whole years of data are returned. For example, bdate = 20170531 and edate = 20170630 will return full data for 2017.)
#'@param param The AQS parameter code for the data selection. AQS uses proprietary 5 digit codes. They may be obtained via the list parameters service. Up to 5 parameters may be requested, separated by commas. Only data for these parameters will be returned.
#'@param state The 2 digit state FIPS code for the state (with leading zero). They may be obtained via the list states service. Only data from within this state will be returned.
#'@param county The 3 digit state FIPS code for the county within the state (with leading zeroes). They may be obtained via the list counties service. Only data from within this county will be returned.
#'@param site The 4 digit AQS site number within the county (with leading zeroes). They may be obtained via the list sites service. Only data from this site will be returned.
#'@param cbsa The 5 digit AQS Core Based Statistical Area code (as defined by the census bureau, with leading zeroes). They may be obtained via the list cbsas service. Only data from this area will be returned.
#'@param minlat The minimum latitude of a geographic box. Decimal latitude with north being positive. Only data north of this latitude will be returned.
#'@param maxlat The maximum latitude of a geographic box. Decimal latitude with north being positive. Only data south of this latitude will be returned.
#'@param minlon The minimum longitude of a geographic box. Decimal longitude with east being positive. Only data east of this longitude will be returned.
#'@param maxlon The maximum longitude of a geographic box. Decimal longitude with east being positive. Only data west of this longitude will be returned. Note that -80 is less than -70.
#'
#'@name monitors
NULL

#'@rdname monitors
#'@export
monitors_by_site <- function(param, bdate, edate, state, county, site) {
	getAQS("monitors/bySite", param = param, bdate = bdate, edate = edate, state = state, county = county, site = site, auth = TRUE)
}

#'@rdname monitors
#'@export
monitors_by_county <- function(param, bdate, edate, state, county) {
	getAQS("monitors/byCounty", param = param, bdate = bdate, edate = edate, state = state, county = county, auth = TRUE)
}

#'@rdname monitors
#'@export
monitors_by_state <- function(param, bdate, edate, state) {
	getAQS("monitors/byState", param = param, bdate = bdate, edate = edate, state = state, auth = TRUE)
}

#'@rdname monitors
#'@export
monitors_by_box <- function(param, bdate, edate, minlat, maxlat, minlon, maxlon) {
	getAQS("monitors/byBox", param = param, bdate = bdate, edate = edate, minlat = minlat, maxlat = maxlat, minlon = minlon, maxlon = maxlon, auth = TRUE)
}

#'@rdname monitors
#'@export
monitors_by_cbsa <- function(param, bdate, edate, cbsa) {
	getAQS("monitors/byCBSA", param = param, bdate = bdate, edate = edate, cbsa = cbsa, auth = TRUE)
}

