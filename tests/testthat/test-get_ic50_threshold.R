test_that("use", {

  supported_mhcs <- netmhc2pan::get_netmhc2pan_alleles()

  expect_silent(
    get_lut_filename(
      peptide_length = 13,
      mhc_haplotype = supported_mhcs[1]
    )
  )
  expect_silent(
    get_ic50_threshold(
      peptide_length = 13,
      mhc_haplotype = "DRB1_0103",
      percentile = 0.02
    )
  )
})

test_that("detailed use", {

  t <- readr::read_csv(
    get_lut_filename(
      peptide_length = 13,
      mhc_haplotype = "DRB1_0103"
    )
  )
  lowest_ic50 <- min(t$ic50)
  median_ic50 <- median(t$ic50)
  heighest_ic50 <- max(t$ic50)

  # 2%: closest to low
  ic50 <- get_ic50_threshold(
    peptide_length = 13,
    mhc_haplotype = "DRB1_0103",
    percentile = 0.02
  )
  expect_true(ic50 < median_ic50)

  # 98%: closest to high
  ic50 <- get_ic50_threshold(
    peptide_length = 13,
    mhc_haplotype = "DRB1_0103",
    percentile = 0.98
  )
  expect_true(ic50 > median_ic50)
})

test_that("IC50 versus LUT", {

  return()

  ggplot2::ggplot(
    get_lut(
      peptide_length = 13,
      mhc_haplotype = "DRB1_0103"
    ),
    ggplot2::aes(x = q, y = ic50)
  ) + ggplot2::geom_point()
})

test_that("simulated peptides must be in LUT", {

  if (Sys.getenv("TRAVIS") == "") return()

  set.seed(42)
  # Simulate n peptides, check if these are in range
  n <- 100
  peptide_length <- 13
  haplotype <- "DRB1_0103"
  peptides <- replicate(n = n, create_random_peptide(peptide_length))
  ic50s <- netmhc2pan::predict_ic50(
    peptides = peptides,
    mhc_haplotype = haplotype
  )
  min_ic50 <- get_ic50_threshold(
    peptide_length = peptide_length,
    mhc_haplotype = haplotype,
    percentile = 0.0
  )
  median_ic50 <- get_ic50_threshold(
    peptide_length = peptide_length,
    mhc_haplotype = haplotype,
    percentile = 0.5
  )
  max_ic50 <- get_ic50_threshold(
    peptide_length = peptide_length,
    mhc_haplotype = haplotype,
    percentile = 1.0
  )
  # All IC50s, 80% are within the range
  expect_true(sum(min_ic50 < ic50s & max_ic50 > ic50s) > 0.8 * n)

  # Median IC50s are similar
  expect_true(median(ic50s$ic50) > 0.93 * median_ic50)
  expect_true(median(ic50s$ic50) < 1.23 * median_ic50)
})
