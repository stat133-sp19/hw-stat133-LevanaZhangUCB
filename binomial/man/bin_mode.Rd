% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bin_summary_measures.R
\name{bin_mode}
\alias{bin_mode}
\title{bin_mode}
\usage{
bin_mode(trials, prob)
}
\arguments{
\item{trials}{representing # of trials (numeric value)}

\item{prob}{representing probability (numeric value)}
}
\value{
mode (numeric value or numeric vector)
}
\description{
determines mode of given probability and given number of trials
}
\examples{
bin_mode(5,0.5)
bin_mode(1,1)
bin_mode(10,0.1)
}
