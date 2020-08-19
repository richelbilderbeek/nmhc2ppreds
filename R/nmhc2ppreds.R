#' nmhc2ppreds: Lookup tables for netmhc2pan IC50 predictions
#'
#' We can predict how well a peptide binds to the presentation molecules
#' used by the immune system. This package allows to see how well a
#' molecule binds relatively.
#'
#' The \code{netmhc2pan} R package can predict the
#' IC50 (50% inhibitory concentration) of a peptide for an MHC-I haplotype.
#' A peptide that is strongly bound to the MHC molecules is in the
#' lower percentile, for example in the lowest 2% of all IC50s.
#' This package determines the threshold IC50 for all percentiles.
#'
#' To be able to do so,
#' the IC50 predictions of 10k random peptides is measured
#' and the distribution at the percentile level is stored as a lookup table.
#' @examples
#' # Get the IC50 value of which 2% of IC50 predictions are below,
#' # that is, bind better to the MHC complexes
#' ic50_threshold <- get_ic50_threshold(
#'   peptide_length = 9,
#'   mhc_haplotype = "DRB1_0103",
#'   percentile = 0.02
#' )
#'
#' # A IC50 value predicted by netmhc2pan
#' my_ic50 <- 100.0
#'
#' if (my_ic50 < ic50_threshold) {
#'   message("This is a binder, as it is in the lowest 2% of all IC50s")
#' }
#' @author Richèl J.C. Bilderbeek
#' @docType package
#' @name nmhc2ppreds
#'
NULL
