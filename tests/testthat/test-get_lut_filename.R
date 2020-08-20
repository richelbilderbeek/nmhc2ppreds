test_that("use", {
  peptide_length <- 13
  mhc_haplotype <- "DRB1_0103"

  filename <- get_lut_filename(
    peptide_length = peptide_length,
    mhc_haplotype = mhc_haplotype
  )
  expect_equal(basename(filename), "random_h3_13.csv")
})

test_that("abuse", {
  peptide_length <- 13
  mhc_haplotype <- "DRB1_0103"

  expect_silent(
    get_lut_filename(
      peptide_length = peptide_length,
      mhc_haplotype = mhc_haplotype
    )
  )
  expect_error(
    get_lut_filename(
      peptide_length = 123,
      mhc_haplotype = mhc_haplotype
    ),
    "No lookup table found for the desired peptide length"
  )
  expect_error(
    get_lut_filename(
      peptide_length = peptide_length,
      mhc_haplotype = "nonsense"
    ),
    "'mhc_haplotype' not in lookup table"
  )
})
