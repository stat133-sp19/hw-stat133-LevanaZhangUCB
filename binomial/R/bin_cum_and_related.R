#' @title bin_cumulative
#' @description determines cumulative distribution of successes a given # of trials and probability
#' @param trials representing # of trials (numeric value)
#' @param prob representing probability (numeric value)
#' @return a list of classes \code{"bincum"} and \code{"data.frame"}
#' @export
#' @examples
#' bin_cumulative(5,0.5)
#' bin_cumulative(1,1)

bin_cumulative <- function(trials,prob){
  succ <- c(1:(trials+1))
  pro <- c(1:(trials+1))
  cumu <- c(1:(trials+1))
  c <- 0
  for (i in 0:trials){
    succ[i+1] <- i
    pro[i+1] <- bin_probability(i,trials,prob)
    c <- c + bin_probability(i,trials,prob)
    cumu[i+1] <- c
  }
  cum <- data.frame(
    successes = succ,
    probability = pro,
    cumulative = cumu
  )
  class(cum) <- c("bincum","data.frame")
  return(cum)
}
#' title plot.cum
#' description plots a line graph with points of a cumulative distribution
#' param dist an object of class "bincum"
#' return a line graph with points
#' @export
plot.bincum <- function(cum){
  if (any(class(cum) == "bincum")) {
    ggplot(data = cum, aes(x = successes, y = cumulative)) +
      geom_line() +
      geom_point() +
      labs(y = "probability")
  }
}
