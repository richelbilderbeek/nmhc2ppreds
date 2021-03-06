% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_ic50_threshold.R
\name{get_ic50_threshold}
\alias{get_ic50_threshold}
\title{Look up the IC50 value of a certain quantile}
\usage{
get_ic50_threshold(peptide_length, mhc_haplotype, percentile)
}
\arguments{
\item{peptide_length}{length of the peptide in amino acids}

\item{mhc_haplotype}{haplotype of either HMC-I or MHC-II.
in netmhc2panr format.
Use \code{netmhc2panr::get_mhc_1_haplotypes}
to get a list of all MHC-I haplotypes.
Use \code{netmhc2panr::get_mhc_2_haplotypes}
to get a list of all MHC-II haplotypes.}

\item{percentile}{the IC50 percentile. The IC50 that separates the top
\code{percentile} from the worse binders}
}
\description{
Look up the IC50 value of a certain quantile.
Such a value can serve as a threshold:
for example, to get the IC50 value from below which the
peptides bind strongest.
}
