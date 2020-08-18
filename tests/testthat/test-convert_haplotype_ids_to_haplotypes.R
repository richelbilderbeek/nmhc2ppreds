test_that("use", {
  lut <- get_haplotype_lut()
  index <- 42
  haplotype_id <- lut$id[index]
  haplotype <- convert_haplotype_ids_to_haplotypes(haplotype_id)
  expect_equal(haplotype, lut$haplotype[index])
})
