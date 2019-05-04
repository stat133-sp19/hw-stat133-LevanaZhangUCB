#' @title bin_choose
#' @description calculates the k-combination of n elements
#' @param n representing number of elements to combine (numeric value)
#' @param k representing number of k-combinations (numeric value)
#' @return a numeric value
#' @export
#' @examples
#' bin_choose(5,3)
#' bin_choose(1,1)
bin_choose <- function(n,k){
  factorial(n)/(factorial(k)*factorial(n-k))
}

#' @title bin_probability
#' @description determines probability of a given # of successes occuring in a given # of trials
#' @param success representing # of successes (numeric vector)
#' @param trials representing # of trials (numeric value)
#' @param prob representing probability (numeric value)
#' @return numeric vector of same length as success
#' @export
#' @examples
#' bin_probability(3,5,0.5)
#' bin_probability(c(1,2,3),5,0.5)
bin_probability <- function(success, trials, prob){
  if (check_success(success,trials) != TRUE){
    stop("invalid success value")
  }
  else if (check_trials(trials) != TRUE){
    stop("invalid trials value")
  }
  else if (check_prob(prob) != TRUE){
    stop("invalid probability value")
  }
  else{
    bin_choose(trials,success)*(prob^success)*((1-prob)^(trials-success))
  }
}
