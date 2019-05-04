#' title aux_mean
#' description determines mean of given probability and given number of trials
#' param trials representing # of trials (numeric value)
#' param prob representing probability (numeric value)
#' return: mean (numeric value)
aux_mean <- function(trials,prob){
  if (check_trials(trials) == TRUE & check_prob(prob) == TRUE) {
    trials*prob
  }
  else{
    stop("invalid trials or prob")
  }
}
#' title aux_variance
#' description determines variance of given probability and given number of trials
#' param trials representing # of trials (numeric value)
#' param prob representing probability (numeric value)
#' return variance (numeric value)
aux_variance <- function(trials,prob){
  trials*prob*(1-prob)
}
#' title: aux_mode
#' description: determines mode of given probability and given number of trials
#' param trials representing # of trials (numeric value)
#' param prob representing probability (numeric value)
#' return mode (numeric value or numeric vector)
aux_mode <- function(trials,prob){
  if(floor(trials*prob + prob) == (trials*prob + prob)){
    return(c((trials*prob + prob),((trials*prob + prob)-1)))
  }
  else{
    floor(trials*prob + prob)
  }
}
#' title aux_skewness
#' description determines skewness of given probability and given number of trials
#' param trials representing # of trials (numeric value)
#' param prob representing probability (numeric value)
#' return skewness (numeric value)
aux_skewness <- function(trials,prob){
  (1-2*prob)/sqrt(trials*prob*(1-prob))
}
#' title aux_kurtosis
#' description determines kurtosis of given probability and given number of trials
#' param trials representing # of trials (numeric value)
#' param prob representing probability (numeric value)
#' return kurtosis (numeric value)
aux_kurtosis <- function(trials,prob){
  (1-6*prob*(1-prob))/(trials*prob*(1-prob))
}
