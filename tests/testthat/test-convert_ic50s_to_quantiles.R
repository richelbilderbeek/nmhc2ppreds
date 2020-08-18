test_that("use", {

  n <- 4
  ic50s <- seq(1, 2)
  t <- convert_ic50s_to_quantiles(ic50s, n = n)
  expect_equal(nrow(t), n + 1)

})
