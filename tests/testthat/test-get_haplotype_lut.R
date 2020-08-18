test_that("use", {
  supported_mhcs <- netmhc2pan::get_netmhc2pan_alleles()

  haplotypes <- sort(unique(as.character(supported_mhcs$mhc)))
  t <- get_haplotype_lut()
  expect_true("haplotype" %in% names(t))
  expect_true("id" %in% names(t))
  expect_equal(nrow(t), length(haplotypes))
  expect_equal(t$haplotype, haplotypes)
  expect_equal(paste0("h", seq(1, nrow(t))), t$id)
})
