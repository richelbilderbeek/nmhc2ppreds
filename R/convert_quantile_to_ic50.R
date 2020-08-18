#' Convert a quantile to an IC50
#' @param lut lookup table
#' @param q the quantile
#' @export
convert_quantile_to_ic50 <- function(
  lut,
  q
) {
  nmhc2ppreds::convert_quantile_to_ic50_old(lut = lut, q = q)
}

#' Convert a quantile to an IC50, olskool
#' @param lut lookup table
#' @param q the quantile
#' @export
convert_quantile_to_ic50_old <- function(
  lut,
  q
) {
  if (q <= 0.0) return(lut$ic50[1])
  if (q >= 1.0) return(utils::tail(lut$ic50, n = 1))

  ic50 <- lut$ic50[lut$q == q]
  if (length(ic50) == 1) return(ic50)

  below_index <- utils::tail(which(lut$q < q), n = 1)
  above_index <- utils::head(which(lut$q > q), n = 1)
  q_below <- lut$q[below_index]
  q_above <- lut$q[above_index]
  ic50_below <- lut$ic50[below_index]
  ic50_above <- lut$ic50[above_index]

  # Fraction that q is between q_below and q_above
  f <- (q - q_below) / (q_above - q_below)
  testthat::expect_true(f >= 0.0)
  testthat::expect_true(f <= 1.0)

  # Delta IC50 between each IC50
  d <- ic50_above - ic50_below

  ic50_below + (f * d)
}

#' Convert a quantile to an IC50, new school
#' @param lut lookup table
#' @param q the quantile
#' @export
convert_quantile_to_ic50_new <- function(
  lut,
  q
) {
  nmhc2ppreds::convert_quantile_to_ic50_old(lut = lut, q = q)
}
