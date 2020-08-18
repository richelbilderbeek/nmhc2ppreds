test_that("use", {
  peptide_length <- 9
  mhc_haplotype <- "HLA-A-01:01"

  lut <- get_lut(
    peptide_length = peptide_length,
    mhc_haplotype = mhc_haplotype
  )
  lut
})
