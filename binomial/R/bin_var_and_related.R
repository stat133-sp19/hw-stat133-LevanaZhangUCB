#' @title bin_variable
#' @description prints a list of # of trials and probability for a random variable
#' @param trials representing # of trials (numeric value)
#' @param prob representing probability (numeric value)
#' @return a list of class \code{"binvar"}
#' @export
#' @examples
#' bin_variable(5,0.5)
#' bin_variable(1,1)
bin_variable <- function(trials,prob){
  if (check_trials(trials) == TRUE & check_prob(prob) == TRUE){
    var <- list(trials,prob)
    names(var) <- c("trials","prob")
    class(var) <- c("binvar")
    return(var)
  }
}
#' title print.binvar
#' description prints trials and probability of a particular random variable
#' param var an object of class "binvar"
#' return concatenated strings
#' @export
print.binvar <- function(var){
  if (any(class(var) == "binvar")) {
    cat(
      '"Binomial Variable"',"\n","\n",
      "Paramaters","\n",
      paste0("- number of trials: ", var$trials),"\n",
      paste0("- prob of success: ", var$prob),"\n"
    )
    invisible(var)
  }

}
#' title summary.binvar
#' description creates a list with statistical calculations of a given random variable (mean, mode, etc.)
#' param var an object of class "binvar"
#' return list of classes "sumvar" and "list"
#' @export
summary.binvar <- function(var){
  if (any(class(var) == "binvar")) {
    sumvar <- list(
      var$trials,
      var$prob,
      aux_mean(var$trials,var$prob),
      aux_variance(var$trials,var$prob),
      aux_mode(var$trials,var$prob),
      aux_skewness(var$trials,var$prob),
      aux_kurtosis(var$trials,var$prob)
    )
  }
  names(sumvar) <- c("trials","prob","mean","variance","mode","skewness","kurtosis")
  class(sumvar) <- c("summary.binvar","list")
  return(sumvar)
}
#' title print.summary.binvar
#' description prints list that contains statistical calculations (mean, mode, etc.) of a given random variable
#' param var an object of class "summary.binvar"
#' return concatenated strings
#' @export
print.summary.binvar <- function(sumvar){
  if (any(class(sumvar) == "summary.binvar")) {
    cat(
      '"Summary Binomial"',"\n", "\n",
      "Parameters","\n",
      paste0("- number of trials: ", sumvar$trials),"\n",
      paste0("- prob of success: ", sumvar$prob),"\n", "\n",
      "Measures", "\n",
      paste0("- mean: ", sumvar$mean),"\n",
      paste0("- variance: ", sumvar$variance),"\n",
      paste0("- mode: ", sumvar$mode),"\n",
      paste0("- skewness: ", sumvar$skewness),"\n",
      paste0("- kurtosis: ", sumvar$kurtosis),"\n"
    )
    invisible(sumvar)
  }
}
