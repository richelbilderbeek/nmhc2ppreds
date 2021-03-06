% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert_haplotype_ids_to_haplotypes.R
\name{convert_haplotype_ids_to_haplotypes}
\alias{convert_haplotype_ids_to_haplotypes}
\title{Convert haplotype IDs to haplotypes}
\usage{
convert_haplotype_ids_to_haplotypes(haplotype_ids)
}
\arguments{
\item{haplotype_ids}{one or more \code{nmhc2ppreds} haplotype IDs,
for example \code{h1}.
Use \link{get_haplotype_lut} to get a lookup table that maps
a \code{nmhc2ppreds} haplotype ID to an netmhc2pan haplotype name}
}
\description{
Convert one or more haplotype IDs to haplotypes,
in netmhc2pan naming format
}
\examples{
convert_haplotype_ids_to_haplotypes("h13")
}
\author{
Richèl J.C. Bilderbeek
}
