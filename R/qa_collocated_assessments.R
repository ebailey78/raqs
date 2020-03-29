#' QA Collocated Assessments
#'
#' Quality assurance data - collocated assessments. Collocated assessments are pairs of samples collected by different samplers at the same time and place. (These are "operational" samplers, assessments with independently calibrated samplers are called "audits".)
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
#'@name qa_collocated_assessments
NULL

#'@rdname qa_collocated_assessments
#'@export
qa_collocated_assessments_by_site <- function(param, bdate, edate, state, county, site) {
	getAQS("qaCollocatedAssessments/bySite", param = param, bdate = bdate, edate = edate, state = state, county = county, site = site, auth = TRUE)
}

#'@rdname qa_collocated_assessments
#'@export
qa_collocated_assessments_by_county <- function(param, bdate, edate, state, county) {
	getAQS("qaCollocatedAssessments/byCounty", param = param, bdate = bdate, edate = edate, state = state, county = county, auth = TRUE)
}

#'@rdname qa_collocated_assessments
#'@export
qa_collocated_assessments_by_state <- function(param, bdate, edate, state) {
	getAQS("qaCollocatedAssessments/byState", param = param, bdate = bdate, edate = edate, state = state, auth = TRUE)
}

#'@rdname qa_collocated_assessments
#'@export
qa_collocated_assessments_by_pqao <- function(param, bdate, edate, pqao) {
	getAQS("qaCollocatedAssessments/byPQAO", param = param, bdate = bdate, edate = edate, pqao = pqao, auth = TRUE)
}

#'@rdname qa_collocated_assessments
#'@export
qa_collocated_assessments_by_ma <- function(param, bdate, edate, ma) {
	getAQS("qaCollocatedAssessments/byMA", param = param, bdate = bdate, edate = edate, ma = ma, auth = TRUE)
}

