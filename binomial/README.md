Workout 03: Building the R Package "binomial"

Date: 2019/03/05

## Overview
`"binomial"` is an R package that provides tools to analyze a binomial random variable.
* `bin_choose()` calculates k-combination of n elements
* `bin_probability()` calculates probability of success of a given number(s) of success for a given 
number of trials and probability of success (ie. a binomial random variable).
* `bin_distribution()` calculates the binomial distribution of a binomial random variable.
* `bin_cumulative()` calculates the cumulative distribution of a binomial random variable.
* `bin_variable()` defines a binomial random variable (number of trials and probability of success)
* `plot()` method for a "bindis" object to plot a binomial distribution.
* `plot()` method for a "bincum" object to plot a cumulative distribution.
* `summary()` method for a "binvar" object to create a list of summary measures of said object.

## Motivation
The goal of this assignment is to build an R package, called `"binomial"`. To achieve this, I coded various functions (checker, auxillary, and main) and methods, wrote tests for these functions through `"testthat"`, and used `"devtools"` and built in RStudio functionalities to finally build the package.

This assignment is essentially to practice building an R package and to review data techniques in R.

## Installation
Install from GitHub via the package `"devtools"`
```r
# install without vignettes
devtools::install_github("stat133-sp19/hw-stat133-LevanaZhangUCB/binomial")

# install with vignettes
devtools::install_github("stat133-sp19/hw-stat133-LevanaZhangUCB/binomial", build_vignettes = TRUE)
```
## Usage

``` r
library(binomial)

# bin_choose
a <- bin_choose(5,3)
a

# bin_probability
b <- bin_probability(c(1:3),5,0.5)
b
c <- bin_probability(3,5,0.5)
c

# bin_distribution
d <- bin_distribution(5,0.5)
d

# plot (distribution)
plot(d)

# bin_cumulative
e <- bin_cumulative(5,0.5)
e

# plot (cumulative)
plot(e)

# bin_variable
f <- bin_variable(5,0.5)
f

# summary (variable)
summary(f)

# bin_mean
g <- bin_mean(5,0.5)
g

# bin_variance
h <- bin_variance(5,0.5)
h

# bin_mode
i <- bin_mode(5,0.5)
i

# bin_skewness
j <- bin_skewness(5,0.5)
j

# bin_kurtosis
k <- bin_kurtosis(5,0.5)
k
```
