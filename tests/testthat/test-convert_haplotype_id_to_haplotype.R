test_that("use", {
  lut <- get_haplotype_lut()
  index <- 42
  haplotype_id <- lut$id[index]
  haplotype <- convert_haplotype_id_to_haplotype(haplotype_id)
  expect_equal(haplotype, lut$haplotype[index])
})
