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
peptide_lengths <- seq(13)

haplotype_lut <- nmhc2ppreds::get_haplotype_lut()

haplotype_indices <- haplotype_lut$id
testthat::expect_true(all(haplotype_indices %in% nmhc2ppreds::get_haplotype_lut()$id))

for (peptide_source in peptide_sources) {
  for (peptide_length in peptide_lengths) {
    for (haplotype_index in haplotype_indices) {
      cmds <- c(
        "sbatch",
        "../../../peregrine/scripts/run_r_script.sh",
        #"Rscript",
        "create_lut.R",
        peptide_source,
        peptide_length,
        haplotype_index
      )
      system2(
        cmds[1],
        cmds[-1]
      )
      while (peregrine::count_jobs() > 990) {
        Sys.sleep(60)
      }
      Sys.sleep(0.5)
    }
  }
}
