#' The mapping from an netmhc2pan name to an ID
#' @export
get_haplotype_lut <- function() {
  mhcs <- netmhc2pan::get_netmhc2pan_alleles()

  t <- tibble::tibble(
    haplotype = sort(unique(as.character(mhcs))),
    id = NA
  )
  t$id <- paste0("h", seq(1, nrow(t)))
  t
}
