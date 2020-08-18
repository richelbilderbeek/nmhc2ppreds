test_that("use", {

  length <- 13
  expect_equal(
    Peptides::lengthpep(create_random_peptide(length = length)),
    length
  )
})
