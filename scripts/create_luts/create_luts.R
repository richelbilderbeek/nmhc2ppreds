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

peptide_sources <- c("random")
peptide_lengths <- 13

haplotype_lut <- nmhc2ppreds::get_haplotype_lut()

haplotype_indices <- NA
if (1 == 1) {
  # Do all
  haplotype_indices <- haplotype_lut$id
} else {
  # Do BBBQ ones only
  needed <- bbbq::get_mhc2_haplotypes()
  for (i in seq_along(needed)) {
    needed[i] <- netmhc2pan::to_netmhc2pan_name(needed[i])
  }
  haplotype_indices <- haplotype_lut$id[which(haplotype_lut$haplotype %in% needed)]
}
testthat::expect_true(all(haplotype_indices %in% nmhc2ppreds::get_haplotype_lut()$id))

for (peptide_source in peptide_sources) {
  for (peptide_length in peptide_lengths) {
    for (haplotype_index in haplotype_indices) {
      call <- NA
      if (peregrine::is_on_peregrine()) {
        call <- c("sbatch", "run_r_script_on_vulture.sh")
      } else {
        call <- "Rscript"
      }
      cmds <- c(
        call,
        "create_lut.R",
        peptide_source,
        peptide_length,
        haplotype_index
      )
      system2(
        cmds[1],
        cmds[-1]
      )
      if (peregrine::is_on_peregrine()) {
        while (peregrine::count_jobs() > 100) {
          Sys.sleep(60)
        }
        Sys.sleep(0.5)
      }
    }
  }
}
