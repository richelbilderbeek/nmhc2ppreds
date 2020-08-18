#' Convert a haplotype ID to a haplotype
#'
#' Convert a haplotype ID to a hapolotype,
#' in netmhc2pan naming format
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' convert_haplotype_id_to_haplotype("h13")
#' @export
convert_haplotype_id_to_haplotype <- function(#nolint indeed a long function name
  haplotype_id
) {
  lut <- nmhc2ppreds::get_haplotype_lut()
  if (!haplotype_id %in% lut$id) {
    stop(
      "Invalid 'haplotype_id'. \n",
      "'haplotype_id': ", haplotype_id
    )
  }
  lut$haplotype[lut$id == haplotype_id]
}
