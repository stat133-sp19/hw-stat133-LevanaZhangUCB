#' title check_prob
#' description checks if given probability value is valid in a probability context
#' param prob representing a probability (numeric value)
#' return answer to "is it valid?" (TRUE or error message)
check_prob <- function(prob){
  if (any(is.numeric(prob) == FALSE)){
    stop("invalid prob value")
  }
  else if (any(prob < 0) | any(prob > 1)){
    stop("p has to be a number between 0 and 1")
  }
  else{
    TRUE
  }
}
#' title check_trials
#' description Checks if given trial value is valid in a probability context
#' param trials (numeric value) representing a given number of trials
#' return answer to "is it valid?" (TRUE or error message)
check_trials <- function(trials){
  if (any(is.numeric(trials) == FALSE)){
    stop("invalid trials value")
  }
  else if (any(floor(trials) != trials) | any(trials < 0)){
    stop("invalid trials value")
  }
  else{
    TRUE
  }
}
#' title check_successes
#' description Checks if a given success value is valid in a probability context
#' param success (numeric vector) representing # of successes
#' param trials (numeric value) representing # of trials
#' return answer to "is it valid?" (TRUE or error message)
check_success <- function(success, trials){
  if (any(is.numeric(success) == FALSE)|any(is.numeric(trials) == FALSE)){
    stop("invalid success or trials value")
  }
  else if (any((floor(trials) == trials) == FALSE) | any(trials < 0)){
    stop("invalid trials value")
  }
  else  if (any((floor(success) == success) == FALSE) | any(success < 0)) {
    stop("invalid success value")

  }
  else if (any((success <= trials) == FALSE)){
    stop("success cannot be greater than trials")
  }
  else{
    TRUE
  }
}
