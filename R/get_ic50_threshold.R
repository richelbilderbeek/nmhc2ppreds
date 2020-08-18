#' Look up the IC50 value of a certain quantile
#'
#' Look up the IC50 value of a certain quantile.
#' Such a value can serve as a threshold:
#' for example, to get the IC50 value from below which the
#' peptides bind strongest.
#' @inheritParams default_params_doc
#' @param percentile the IC50 percentile. The IC50 that separates the top
#' \code{percentile} from the worse binders
#' @export
get_ic50_threshold <- function(
  peptide_length = 9,
  mhc_haplotype,
  percentile = 0.02
) {
  lut <- nmhc2ppreds::get_lut(
    peptide_length = peptide_length,
    mhc_haplotype = mhc_haplotype
  )
  nmhc2ppreds::convert_quantile_to_ic50(lut = lut, q = percentile)
}
