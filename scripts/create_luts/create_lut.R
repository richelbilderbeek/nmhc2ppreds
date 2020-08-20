# Creates lookup tables
#
# Usage:
#
#   Rscript create_luts.R [peptide_source] [peptide_length] [haplotype_index]
#
# * [peptide_source]: peptide source, must be 'random', 'covid', 'human'
# * [peptide_length]: a number from 1 to and including 15
# * [haplotype_index]: the haplotype index, from 1 to and including 284
#
# For example:
#
#   Rscript create_luts.R 1
#
if (1 == 2) {
  remotes::install_github("richelbilderbeek/netmhc2pan", ref = "develop")
}

library(testthat)
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 3) {
  args <- c("random", "9", "h1")
}
testthat::expect_equal(length(args), 3)
message(
  "Running with arguments '", args[1], "', '", args[2], "' and '", args[3], "'"
)


peptide_source <- args[1]
message("peptide_source: '", peptide_source, "'")
peptide_length <- args[2]
message("peptide_length: '", peptide_length, "'")
haplotype_id <- args[3]
message("haplotype_id: '", haplotype_id, "'")
testthat::expect_true(haplotype_id %in% nmhc2ppreds::get_haplotype_lut()$id)

t_haplotype <- nmhc2ppreds::get_haplotype_lut()
haplotype <- t_haplotype$haplotype[t_haplotype$id == haplotype_id]
message("haplotype: ", haplotype)

supported_mhcs <- as.character(netmhc2pan::get_netmhc2pan_alleles())

if (!haplotype %in% supported_mhcs) {
  message(
    "Combination of haplotype '", haplotype, "' ",
    "and peptide length '", peptide_length, "' ",
    "not supported by netmhc2pan"
  )
  q()
}

target_filename <- paste0(peptide_source, "_", haplotype_id, "_", peptide_length, ".csv")
message("target_filename: '", target_filename, "'")

if (file.exists(target_filename)) {
  message("File '", target_filename, "' already exists. Done!")
  q()
}

n_peptides <- 1000
message("n_peptides: ", n_peptides)

n_quantiles <- 100
message("n_quantiles: ", n_quantiles)

library(netmhc2pan)

peptides <- replicate(
  n = n_peptides,
  nmhc2ppreds::create_random_peptide(length = peptide_length)
)

ic50s <- netmhc2pan::predict_ic50(
  peptides = peptides,
  mhc_haplotype = haplotype
)

q <- nmhc2ppreds::convert_ic50s_to_quantiles(ic50s$ic50, n = n_quantiles)

readr::write_csv(q, target_filename)
