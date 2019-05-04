#' @title bin_mean
#' @description determines mean of given probability and given number of trials
#' @param trials representing # of trials (numeric value)
#' @param prob representing probability (numeric value)
#' @return mean (numeric value)
#' @export
#' @examples
#' bin_mean(5,0.5)
#' bin_mean(1,1)
bin_mean <- function(trials,prob){
  if (check_trials(trials) == TRUE & check_prob(prob) == TRUE){
    aux_mean(trials,prob)
  }
}
#' @title bin_variance
#' @description determines variance of given probability and given number of trials
#' @param trials representing # of trials (numeric value)
#' @param prob representing probability (numeric value)
#' @return variance (numeric value)
#' @export
#' @examples
#' bin_variance(5,0.5)
#' bin_variance(1,1)
bin_variance <- function(trials,prob){
  if (check_trials(trials) == TRUE & check_prob(prob) == TRUE){
    aux_variance(trials,prob)
  }
}

#' @title bin_mode
#' @description determines mode of given probability and given number of trials
#' @param trials representing # of trials (numeric value)
#' @param prob representing probability (numeric value)
#' @return mode (numeric value or numeric vector)
#' @export
#' @examples
#' bin_mode(5,0.5)
#' bin_mode(1,1)
#' bin_mode(10,0.1)
bin_mode <- function(trials,prob){
  if (check_trials(trials) == TRUE & check_prob(prob) == TRUE){
    aux_mode(trials,prob)
  }
}
#' @title bin_skewness
#' @description determines skewness of given probability and given number of trials
#' @param trials representing # of trials (numeric value)
#' @param prob representing probability (numeric value)
#' @return skewness (numeric value)
#' @export
#' @examples
#' bin_skewness(5,0.5)
#' bin_skewness(1,1)
bin_skewness <- function(trials,prob){
  if (check_trials(trials) == TRUE & check_prob(prob) == TRUE){
    aux_skewness(trials,prob)
  }
}
#' @title bin_kurtosis
#' @description determines kurtosis of given probability and given number of trials
#' @param trials representing # of trials (numeric value)
#' @param prob representing probability (numeric value)
#' @return kurtosis (numeric value)
#' @export
#' @examples
#' bin_kurtosis(5,0.5)
#' bin_kurtosis(1,1)
bin_kurtosis <- function(trials,prob){
  if (check_trials(trials) == TRUE & check_prob(prob) == TRUE){
    aux_kurtosis(trials,prob)
  }
}

