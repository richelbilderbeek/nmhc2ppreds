#' Convert IC50s to a quantile table
#' @param ic50s the IC50 values
#' @param n the number of steps from 0.0 to 1.0.
#'   For example, use 0.1 for 10 steps
#' @return a tibble with two columns: \code{q} the quantiles,
#' and \code{ic50} the IC50s
#' @export
convert_ic50s_to_quantiles <- function(ic50s, n = 100) {
  probs <- seq(0.0, 1.0, by = 1.0 / n)
  qs <- stats::quantile(ic50s, probs = probs)
  tibble::tibble(
    q = probs,
    ic50 = as.numeric(qs)
  )
}
