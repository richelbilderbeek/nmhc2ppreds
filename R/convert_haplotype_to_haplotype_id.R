#' Convert a haplotype to a haplotype ID
#'
#' Convert a haplotype (in netmhc2pan naming format) to a hapolotype ID
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' convert_haplotype_to_haplotype_id("DRB1_0311")
#' @export
convert_haplotype_to_haplotype_id <- function(#nolint indeed a long function name
  haplotype
) {
  lut <- nmhc2ppreds::get_haplotype_lut()
  if (!haplotype %in% lut$haplotype) {
    stop(
      "Invalid 'haplotype'. \n",
      "'haplotype': ", haplotype
    )
  }
  lut$id[lut$haplotype == haplotype]
}
