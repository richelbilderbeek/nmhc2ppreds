#' Create a random peptide
#' @param length length of the peptide in amino acids
#' @author Richèl J.C. Bilderbeek
#' @examples
#' create_random_peptide()
#' @export
create_random_peptide <- function(length) {
  paste0(
    sample(x = Peptides::aaList(), size = length, replace = TRUE),
    collapse = ""
  )
}
