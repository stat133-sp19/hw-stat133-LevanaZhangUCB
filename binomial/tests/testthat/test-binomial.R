context("Tests for binomial functions")
test_that("bin_choose works with normal inputs",{
  n <- 5
  k <- 3
  choose <- factorial(n)/(factorial(k)*factorial(n-k))
  expect_length(bin_choose(n,k),length(n))
  expect_equal(bin_choose(n,k),choose)
  expect_type(bin_choose(n,k),"double")
})

test_that("bin_probability works with normal inputs",{
  success <- 3
  trials <- 5
  prob <- 0.5
  probability <-(prob^success)*((1-prob)^(trials-success))*factorial(trials)/(factorial(success)*factorial(trials-success))
  expect_equal(bin_probability(success,trials,prob),probability)
  expect_type(bin_probability(success,trials,prob),"double")
  expect_lte(bin_probability(success,trials,prob), 1)
})

test_that("bin_distribution works with normal inputs",{
  trials <- 5
  prob <- 0.5
  expect_type(bin_distribution(trials,prob),"list")
  expect_is(bin_distribution(trials,prob),c("bindis","data.frame"))
  expect_named(bin_distribution(trials,prob),c("successes","probability"))
})

test_that("bin_cumulative works with normal inputs",{
  trials <- 5
  prob <- 0.5
  expect_type(bin_cumulative(trials,prob),"list")
  expect_is(bin_cumulative(trials,prob),c("bincum","data.frame"))
  expect_named(bin_cumulative(trials,prob),c("successes","probability","cumulative"))
})
