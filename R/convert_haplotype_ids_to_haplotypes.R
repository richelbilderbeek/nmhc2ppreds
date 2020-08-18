#' Convert haplotype IDs to haplotypes
#'
#' Convert one or more haplotype IDs to haplotypes,
#' in netmhc2pan naming format
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' convert_haplotype_ids_to_haplotypes("h13")
#' @export
convert_haplotype_ids_to_haplotypes <- function(#nolint indeed a long function name
  haplotype_ids
) {
  haplotypes <- rep(NA, length(haplotype_ids))
  for (i in seq_along(haplotypes)) {
    haplotypes[i] <- nmhc2ppreds::convert_haplotype_id_to_haplotype(
      haplotype_ids[i]
    )
  }
  haplotypes
}
