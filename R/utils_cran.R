#' CRAN setup code
#'
#' Some code to comply with CRAN policies, e.g.
#' limiting data.table CPU cores for examples/tests
#'
#' @export
#' @keywords internal
.for_cran <- function() {
  cores <- min(
    getOption("Ncpus", default = 2L),
    as.integer(Sys.getenv("OMP_THREAD_LIMIT", unset = "2")),
    floor(as.integer(Sys.getenv(
      "_R_CHECK_EXAMPLE_TIMING_CPU_TO_ELAPSED_THRESHOLD_",
      unset = 2
    ))),
    2L,
    na.rm = TRUE
  )

  data.table::setDTthreads(cores)
}
