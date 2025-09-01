#' Statistical Mode
#'
#' Computes the statistical mode, i.e. the value that appears most often in a
#' vector. Returns the first match, if TRUE for multiple values.
#'
#' @param x A vector of data values.
#' @param ... Further arguments, currently unused.
#' @param na.rm a logical evaluating to `TRUE` or `FALSE` indicating whether
#'   `NA` values should be stripped before the computation proceeds.
#'
#' @return The statistical mode with the same type as the input vector x.
#' @export
#'
#' @examples
#' vector_numeric <- sample(1:5, 15, TRUE)
#' vector_numeric
#' stat_mode(vector_numeric)
#'
#' vector_character <- sample(LETTERS[1:5], 15, TRUE)
#' vector_character
#' stat_mode(vector_character)
stat_mode <- function(x, ..., na.rm = FALSE) {
  if (isTRUE(na.rm)) {
    x <- x[!is.na(x)]
  }
  ux <- unique(x)
  tbl <- tabulate(match(x, ux))
  ux[which.max(tbl)]
}
