#' QA One Point QC Raw Data
#'
#' Quality assurance data - one point quality control check raw data. At least every two weeks, certain gaseous monitors must be challenged with a known concentration to determine monitor performance.
#'
#'@param bdate The begin date of the data selection in YYYYMMDD format. Only data on or after this date will be returned. (Note, for annual data, only the year portion of the bdate and edate are used and only whole years of data are returned. For example, bdate = 20171231 and edate = 20180101 will return full data for 2017 and 2018.)
#'@param edate The end date of the data selection in YYYYMMDD format. Only data on or before this date will be returned. The end date must be in the same year as the begin date. This rule does not apply to the Monitors service. (Note, for annual data, only the year portion of the bdate and edate are used and only whole years of data are returned. For example, bdate = 20170531 and edate = 20170630 will return full data for 2017.)
#'@param param The AQS parameter code for the data selection. AQS uses proprietary 5 digit codes. They may be obtained via the list parameters service. Up to 5 parameters may be requested, separated by commas. Only data for these parameters will be returned.
#'@param state The 2 digit state FIPS code for the state (with leading zero). They may be obtained via the list states service. Only data from within this state will be returned.
#'@param county The 3 digit state FIPS code for the county within the state (with leading zeroes). They may be obtained via the list counties service. Only data from within this county will be returned.
#'@param site The 4 digit AQS site number within the county (with leading zeroes). They may be obtained via the list sites service. Only data from this site will be returned.
#'@param pqao The 4 digit AQS Primary Quality Assurance Organization code (with leading zeroes). They may be obtained via the list pqaos service. Only data for this PQAO will be returned. Only used in QA Data services.
#'@param ma The 4 digit AQS Monitoring Agency code (with leading zeroes). They may be obtained via the list mas service. Only data for this Monitoring Agency will be returned. Only used in QA Data services.
#'
#'@name qa_one_point_qc_raw_data
NULL

#'@rdname qa_one_point_qc_raw_data
#'@export
qa_one_point_qc_raw_data_by_site <- function(param, bdate, edate, state, county, site) {
	getAQS("qaOnePointQcRawData/bySite", param = param, bdate = bdate, edate = edate, state = state, county = county, site = site, auth = TRUE)
}

#'@rdname qa_one_point_qc_raw_data
#'@export
qa_one_point_qc_raw_data_by_county <- function(param, bdate, edate, state, county) {
	getAQS("qaOnePointQcRawData/byCounty", param = param, bdate = bdate, edate = edate, state = state, county = county, auth = TRUE)
}

#'@rdname qa_one_point_qc_raw_data
#'@export
qa_one_point_qc_raw_data_by_state <- function(param, bdate, edate, state) {
	getAQS("qaOnePointQcRawData/byState", param = param, bdate = bdate, edate = edate, state = state, auth = TRUE)
}

#'@rdname qa_one_point_qc_raw_data
#'@export
qa_one_point_qc_raw_data_by_pqao <- function(param, bdate, edate, pqao) {
	getAQS("qaOnePointQcRawData/byPQAO", param = param, bdate = bdate, edate = edate, pqao = pqao, auth = TRUE)
}

#'@rdname qa_one_point_qc_raw_data
#'@export
qa_one_point_qc_raw_data_by_ma <- function(param, bdate, edate, ma) {
	getAQS("qaOnePointQcRawData/byMA", param = param, bdate = bdate, edate = edate, ma = ma, auth = TRUE)
}

