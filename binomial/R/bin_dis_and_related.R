#' @title bin_distribution
#' @description determines probability distribution of successes a given # of trials and probability
#' @param trials representing # of trials (numeric value)
#' @param prob representing probability (numeric value)
#' @return a list of classes \code{"bindis"} and \code{"data.frame"}
#' @export
#' @examples
#' bin_distribution(5,0.5)
#' bin_distribution(1,1)
bin_distribution <- function(trials,prob){
  succ <- c(1:(trials+1))
  pro <- c(1:(trials+1))
  for (i in 0:trials){
    succ[i+1] <- i
    pro[i+1] <- bin_probability(i,trials,prob)
  }
  dist <- data.frame(
    successes = succ,
    probability = pro
  )
  class(dist) <- c("bindis","data.frame")
  return(dist)
}
#' title plot.bindis
#' description plots a bar graph of a binomial distribution
#' param dist an object of class "bindis"
#' return a bar plot
#' @export
plot.bindis <- function(dist){
  if (any(class(dist) == "bindis")) {
    ggplot(data = dist, aes(x = successes, y = probability)) +
      geom_bar(stat = "identity")
  }
}
