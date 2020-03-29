#' Sign up
#'
#' Creates an account or resets a password. Requires validation of registered email address. Email will be sent to the registered address from aqsdatamart@epa.gov. This service can also be used to reset passwords.
#'
#'@param email The email address of the requester.
#'
#'@name sign_up
NULL

#'@rdname sign_up
#'@export
signup <- function(email) {
	getAQS("signup", email = email, auth = FALSE)
}

