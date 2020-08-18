#' Get the filename for a lookup-table
#'
#' Get the filename for a lookup-table for a specific
#' peptide size and haplotype.
#' @inheritParams default_params_doc
#' @export
get_lut_filename <- function(
  peptide_length,
  mhc_haplotype
) {
  haplotype_lut <- nmhc2ppreds::get_haplotype_lut()

  if (!mhc_haplotype %in% haplotype_lut$haplotype) {
    stop(
      "'mhc_haplotype' not in lookup table. ",
      "'mhc_haplotype': ", mhc_haplotype
    )
  }
  haplotype_id <- haplotype_lut$id[mhc_haplotype == haplotype_lut$haplotype]
  filename <- paste0("random_", haplotype_id, "_", peptide_length, ".csv")
  full <- system.file("extdata", filename, package = "nmhc2ppreds")
  if (!file.exists(full)) {
    stop(
      glue::glue(
        "No lookup table found for the desired peptide length. \n",
        "'peptide_length': {peptide_length} \n",
        "'mhc_haplotype':  '{mhc_haplotype}' \n",
        "'filename': '{filename}'"
      )
    )
  }
  full
}
