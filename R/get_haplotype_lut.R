#' The mapping from an netmhc2pan name to an ID
#' @export
get_haplotype_lut <- function() {
  t <- tibble::tibble(
    haplotype = netmhc2pan::get_netmhc2pan_alleles(),
    id = NA
  )
  t$id <- paste0("h", seq(1, nrow(t)))
  t
}
