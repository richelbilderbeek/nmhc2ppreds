#' Get the lookup-table
#'
#' Get the lookup-table for a specific
#' peptide size and haplotype.
#' @inheritParams default_params_doc
#' @export
get_lut <- function(
  peptide_length,
  mhc_haplotype
) {
  filename <- nmhc2ppreds::get_lut_filename(
    peptide_length = peptide_length,
    mhc_haplotype = mhc_haplotype
  )
  readr::read_csv(
    filename,
    col_types = readr::cols(
      q = readr::col_double(),
      ic50 = readr::col_double()
    )
  )
}
