#### UTILS ###

# External functions imported and sometimes re-exported

# @keywords internal
# @importFrom rlang .data `%||%` .env

NULL

# Pipe operator
#
# See `magrittr::[\%>\%][magrittr::pipe]` for details.
#
# @name %>%
# @rdname pipe
# @export
# @importFrom magrittr %>%
NULL

# compute most recent season
most_recent_season <- function() {
  today <- Sys.Date()
  current_year <- as.integer(format(today, format = "%Y"))
  current_month <- as.integer(format(today, format = "%m"))

  if (current_month >= 9) return(current_year)

  return(current_year - 1)
}

# check if a package is installed
is_installed <- function(pkg) requireNamespace(pkg, quietly = TRUE)
