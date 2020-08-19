test_that("use", {
  peptide_length <- 9
  mhc_haplotype <- "DRB1_0103"

  lut <- get_lut(
    peptide_length = peptide_length,
    mhc_haplotype = mhc_haplotype
  )
  lut
})
