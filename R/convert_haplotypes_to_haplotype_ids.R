#' Convert haplotypes to haplotype IDs
#'
#' Convert one or more haplotypes (in netmhc2pan naming format)
#' to haplotype IDs
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' convert_haplotypes_to_haplotype_ids("DRB1_0101")
#' @export
convert_haplotypes_to_haplotype_ids <- function(#nolint indeed a long function name
  haplotypes
) {
  haplotype_ids <- rep(NA, length(haplotypes))
  for (i in seq_along(haplotype_ids)) {
    haplotype_ids[i] <- nmhc2ppreds::convert_haplotype_to_haplotype_id(
      haplotypes[i]
    )
  }
  haplotype_ids
}
