context("Tests for summary measures (auxillary)")
test_that("aux_mean works with normal inputs",{
  trials <- 5
  prob <- 0.5
  mean <- trials*prob
  expect_length(aux_mean(trials,prob),length(prob))
  expect_equal(aux_mean(trials,prob),mean)
  expect_type(aux_mean(trials,prob),"double")
})

test_that("aux_variance works with normal inputs",{
  trials <- 5
  prob <- 0.5
  variance <- trials*prob*(1-prob)
  expect_length(aux_variance(trials,prob),length(prob))
  expect_equal(aux_variance(trials,prob),variance)
  expect_type(aux_variance(trials,prob),"double")
})

test_that("aux_mode works with normal inputs",{
  trials1 <- 5
  trials2 <- 4
  prob <- 0.5
  mode1 <- c((trials1*prob + prob),((trials1*prob + prob)-1))
  mode2 <- floor(trials2*prob + prob)
  expect_length(aux_mode(trials1,prob),length(mode1))
  expect_equal(aux_mode(trials1,prob),mode1)
  expect_type(aux_mode(trials1,prob),"double")
  expect_length(aux_mode(trials2,prob),length(mode2))
  expect_equal(aux_mode(trials2,prob),mode2)
  expect_type(aux_mode(trials2,prob),"double")
})

test_that("aux_skewness works with normal inputs",{
  trials <- 5
  prob <- 0.5
  skewness <- (1-2*prob)/sqrt(trials*prob*(1-prob))
  expect_length(aux_skewness(trials,prob),length(skewness))
  expect_equal(aux_skewness(trials,prob),skewness)
  expect_type(aux_skewness(trials,prob),"double")
})

test_that("aux_kurtosis works with normal inputs",{
  trials <- 5
  prob <- 0.5
  kurtosis <- (1-6*prob*(1-prob))/(trials*prob*(1-prob))
  expect_length(aux_kurtosis(trials,prob),length(kurtosis))
  expect_equal(aux_kurtosis(trials,prob),kurtosis)
  expect_type(aux_kurtosis(trials,prob),"double")
})
