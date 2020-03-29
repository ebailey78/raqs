#' Sample Data
#'
#' Returns sample data - the finest grain data reported to EPA. Usually hourly, sometimes 5-minute, 12-hour, etc. This service is available in several geographic selections based on geography: site, county, state, CBSA (core based statistical area, a grouping of counties), or latitude/longitude bounding box.
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
#'@param cbdate Each value in our database has a "date of last change" that indicates when it was last updated. The cbdate is used to filter data based on the change date, cbdate = change begin date in YYYYMMDD format. Only data that changed on or after this date will be returned.
#'@param cedate Each value in our database has a "date of last change" that indicates when it was last updated. The cedate is used to filter data based on the change date, cedate = change end date in YYYYMMDD format. Only data that changed on or before this date will be returned.
#'
#'@name sample_data
NULL

#'@rdname sample_data
#'@export
sample_data_by_site <- function(param, bdate, edate, state, county, site, cbdate, cedate) {
	getAQS("sampleData/bySite", param = param, bdate = bdate, edate = edate, state = state, county = county, site = site, cbdate = cbdate, cedate = cedate, auth = TRUE)
}

#'@rdname sample_data
#'@export
sample_data_by_county <- function(param, bdate, edate, state, county, cbdate, cedate) {
	getAQS("sampleData/byCounty", param = param, bdate = bdate, edate = edate, state = state, county = county, cbdate = cbdate, cedate = cedate, auth = TRUE)
}

#'@rdname sample_data
#'@export
sample_data_by_state <- function(param, bdate, edate, state, cbdate, cedate) {
	getAQS("sampleData/byState", param = param, bdate = bdate, edate = edate, state = state, cbdate = cbdate, cedate = cedate, auth = TRUE)
}

#'@rdname sample_data
#'@export
sample_data_by_box <- function(param, bdate, edate, minlat, maxlat, minlon, maxlon, cbdate, cedate) {
	getAQS("sampleData/byBox", param = param, bdate = bdate, edate = edate, minlat = minlat, maxlat = maxlat, minlon = minlon, maxlon = maxlon, cbdate = cbdate, cedate = cedate, auth = TRUE)
}

#'@rdname sample_data
#'@export
sample_data_by_cbsa <- function(param, bdate, edate, cbsa, cbdate, cedate) {
	getAQS("sampleData/byCBSA", param = param, bdate = bdate, edate = edate, cbsa = cbsa, cbdate = cbdate, cedate = cedate, auth = TRUE)
}

