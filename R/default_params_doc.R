#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param binding_strength_threshold threshold of the MHC2 allele's
#'   binding strength. A low threshold, e.g. \code{5.0}, selects for the top
#'   5 percent best binders
#' @param fasta_filename name of a FASTA file
#' @param haplotype the netmhc2pan haplotype ID,
#' for example \code{HLA-A33:01}.
#' Use \link{get_haplotype_lut} to get a lookup table that maps
#' a \code{nmhc2ppreds} haplotype ID to an netmhc2pan haplotype name
#' @param haplotypes one ore more netmhc2pan haplotype IDs,
#' for example \code{HLA-A33:01}.
#' Use \link{get_haplotype_lut} to get a lookup table that maps
#' a \code{nmhc2ppreds} haplotype ID to an netmhc2pan haplotype name
#' @param haplotype_id the \code{nmhc2ppreds} haplotype ID,
#' for example \code{h1}.
#' Use \link{get_haplotype_lut} to get a lookup table that maps
#' a \code{nmhc2ppreds} haplotype ID to an netmhc2pan haplotype name
#' @param haplotype_ids one or more \code{nmhc2ppreds} haplotype IDs,
#' for example \code{h1}.
#' Use \link{get_haplotype_lut} to get a lookup table that maps
#' a \code{nmhc2ppreds} haplotype ID to an netmhc2pan haplotype name
#' @param ic50_threshold peptides with a predicted IC50 value (in nM)
#'   lower than this will be considered binders.
#'   A threshold of 500 (nM) is common.
#' @param max_hydrophobicity the maximal hydrophobicity
#' @param mhc_haplotype haplotype of either HMC-I or MHC-II.
#' in netmhc2panr format.
#' Use \code{netmhc2panr::get_mhc_1_haplotypes}
#' to get a list of all MHC-I haplotypes.
#' Use \code{netmhc2panr::get_mhc_2_haplotypes}
#' to get a list of all MHC-II haplotypes.
#' @param min_hydrophobicity the minimal hydrophobicity
#' @param n_peptides number of peptides
#' @param peptide_length length of the peptide in amino acids
#' @param protein_sequence a protein sequence
#' @param protein_sequences one or more protein sequences
#' @param verbose set to TRUE for more output
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  binding_strength_threshold,
  fasta_filename,
  haplotype,
  haplotypes,
  haplotype_id,
  haplotype_ids,
  ic50_threshold,
  max_hydrophobicity,
  mhc_haplotype,
  min_hydrophobicity,
  n_peptides,
  peptide_length,
  protein_sequence,
  protein_sequences,
  verbose
) {
  # Nothing
}
