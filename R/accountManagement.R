#'setAQSUser
#'
#'Function to store your AQS credentials so they can be used by raqs
#'
#'@param email The email you used to sign up for AQS
#'@param key The access key provided by AQS
#'
#'@export
setAQSUser <- function(email, key) {
  aqsSettings <- list(
    email = email,
    key = key
  )
  save(aqsSettings, file = settingsPath)
}
