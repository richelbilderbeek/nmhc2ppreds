test_that("use", {

  lowest <- 3.0
  highest <- 4.0
  lut <- convert_ic50s_to_quantiles(c(lowest, highest), n = 2)

  # Below zero, is lowest
  expect_equal(convert_quantile_to_ic50(lut, q = -1.0), lowest)

  # Below zero, is lowest
  expect_equal(convert_quantile_to_ic50(lut, q = 3.0), highest)

  expect_equal(convert_quantile_to_ic50(lut, q = 0.0), 3.0)
  expect_equal(convert_quantile_to_ic50(lut, q = 1.0), 4.0)

  expect_equal(convert_quantile_to_ic50(lut, q = 0.5), 3.5)

  expect_equal(convert_quantile_to_ic50(lut, q = 0.25), 3.25)
})

test_that("speed", {

  get_haplotype_lut()
  lowest <- 3.0
  highest <- 4.0
  lut <- convert_ic50s_to_quantiles(c(lowest, highest), n = 2)

  # Below zero, is lowest
  expect_equal(convert_quantile_to_ic50(lut, q = -1.0), lowest)

  # Below zero, is lowest
  expect_equal(convert_quantile_to_ic50(lut, q = 3.0), highest)

  expect_equal(convert_quantile_to_ic50(lut, q = 0.0), 3.0)
  expect_equal(convert_quantile_to_ic50(lut, q = 1.0), 4.0)

  expect_equal(convert_quantile_to_ic50(lut, q = 0.5), 3.5)

  expect_equal(convert_quantile_to_ic50(lut, q = 0.25), 3.25)
})
