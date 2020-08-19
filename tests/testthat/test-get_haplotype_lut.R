test_that("use", {
  haplotypes <- netmhc2pan::get_netmhc2pan_alleles()

  t <- get_haplotype_lut()
  expect_true("haplotype" %in% names(t))
  expect_true("id" %in% names(t))
  expect_equal(nrow(t), length(haplotypes))
  expect_equal(t$haplotype, haplotypes)
  expect_equal(paste0("h", seq(1, nrow(t))), t$id)
})
