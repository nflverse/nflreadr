#### UTILS ###

.datatable.aware <- TRUE

# compute most recent season
most_recent_season <- function(roster = FALSE) {
  today <- Sys.Date()
  current_year <- as.integer(format(today, format = "%Y"))
  current_month <- as.integer(format(today, format = "%m"))

  if ((isFALSE(roster) && current_month >= 9) ||
      (isTRUE(roster) && current_month >= 3)) {
    return(current_year)
  }

  return(current_year - 1)
}

# check if a package is installed
is_installed <- function(pkg) requireNamespace(pkg, quietly = TRUE)

choose_loader <- function(type) {

  switch(type,
    "rds" = rds_from_url,
    "qs" = qs_from_url
  )
}
