context("Tests for checker functions")
test_that("check_prob works with input that are numbers between 0 and 1",{
  p1 <- 0.5
  p2 <- 1L
  expect_length(check_prob(p1),length(p1))
  expect_true(check_prob(p1))
  expect_type(check_prob(p1),"logical")
  expect_length(check_prob(p2),1)
  expect_true(check_prob(p2))
  expect_type(check_prob(p2),"logical")
})
test_that("check_trials works with normal inputs",{
  t1 <- 5
  expect_length(check_trials(t1),length(t1))
  expect_true(check_trials(t1))
  expect_type(check_trials(t1),"logical")
})
test_that("check_success works with normal inputs",{
  s1 <- c(0,3)
  s2 <- 5
  expect_length(check_success(3,5),1)
  expect_true(check_success(3,5))
  expect_type(check_success(3,5),"logical")
})
