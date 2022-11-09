#' Standardize NFL Team Abbreviations
#'
#' This function standardizes NFL team abbreviations to nflverse defaults.
#' This helps for joins and plotting, especially with the new nflplotR package!
#'
#' @param abbr a character vector of abbreviations
#' @param current_location If `TRUE` (the default), the abbreviation of the most
#'   recent team location will be used.
#' @param keep_non_matches If `TRUE` (the default) an element of `abbr` that can't
#'   be matched to any of the internal mapping vectors will be kept as is. Otherwise
#'   it will be replaced with `NA`.
#'
#' @return A character vector with the length of `abbr` and cleaned team abbreviations
#'   if they are included in [`team_abbr_mapping`] or [`team_abbr_mapping_norelocate`]
#'   (depending on the value of `current_location`). Non matches may be replaced
#'   with `NA` (depending on the value of `keep_non_matches`).
#' @export
#' @examples
#' x <- c("PIE", "LAR", "PIT", "CRD", "OAK", "SL")
#' # use current location and keep non matches
#' clean_team_abbrs(x)
#'
#' # keep old location and replace non matches
#' clean_team_abbrs(x, current_location = FALSE, keep_non_matches = FALSE)
clean_team_abbrs <- function(abbr, current_location = TRUE, keep_non_matches = TRUE) {
  stopifnot(
    is.character(abbr),
    is.logical(current_location)
  )

  m <- if (isTRUE(current_location)) nflreadr::team_abbr_mapping else nflreadr::team_abbr_mapping_norelocate


  a <- unname(m[toupper(abbr)])

  if (any(is.na(a)) && getOption("nflreadr.verbose", default = interactive())) {
    cli::cli_warn("Abbreviations not found in `nflreadr::team_abbr_mapping`: {paste(utils::head(abbr[is.na(a)], 10), collapse = ', ')}")
  }

  if (isTRUE(keep_non_matches)) a <- a %c% abbr

  a
}

#' Create Player Merge Names
#'
#' Applies some name-cleaning heuristics to facilitate joins. These heuristics may include:
#'   - removing periods and apostrophes
#'   - removing common suffixes, such as Jr, Sr, II, III, IV
#'   - converting to lowercase
#'   - using `ffscrapr::dp_name_mapping` to do common name substitutions, such as Mitch Trubisky to Mitchell Trubisky
#'
#' Equivalent to the operation done by `ffscrapr::dp_clean_names()` and uses the same player name database.
#'
#' @param player_name a character vector of player names
#' @param lowercase defaults to FALSE - if TRUE, converts to lowercase
#' @param convert_lastfirst defaults to TRUE - converts names from "Last, First" to "First Last"
#' @param use_name_database uses internal name database to do common substitutions (Mitchell Trubisky to Mitch Trubisky etc)
#'
#' @return a character vector of cleaned names
#'
#' @examples
#'
#' clean_player_names(c("A.J. Green", "Odell Beckham Jr.  ", "Le'Veon Bell Sr."))
#'
#' clean_player_names(c("Trubisky,      Mitch", "Atwell, Chatarius", "Elliott, Zeke", "Elijah Moore"),
#'                   convert_lastfirst = TRUE)
#'
#' @export
clean_player_names <- function(player_name,
                               lowercase = FALSE,
                               convert_lastfirst = TRUE,
                               use_name_database = TRUE){

  stopifnot(
    is.character(player_name),
    is.logical(c(lowercase,convert_lastfirst,use_name_database)),
    length(c(lowercase,convert_lastfirst,use_name_database))==3,
    !any(is.na(c(lowercase,convert_lastfirst,use_name_database)))
  )

  n <- player_name

  # squish internal whitespace
  n <- gsub(pattern = "\\s+", replacement = " ", x = n)

  # trim whitespace
  n <- gsub(pattern = "^\\s|\\s$", replacement = "", x = n)

  # convert Last, First
  if(convert_lastfirst) n <- gsub(pattern = "^(.+), (.+)$", replacement = "\\2 \\1", x = n)

  # suffix removal
  n <- gsub(pattern = " Jr\\.$| Sr\\.$| III$| II$| IV$| V$|'|\\.|,",
            replacement = "",
            x = n,
            ignore.case = TRUE)

#   # squish internal whitespace
#   n <- gsub(pattern = "\\s+", replacement = " ", x = n)
#
#   # trim whitespace
#   n <- gsub(pattern = "^\\s|\\s$", replacement = "", x = n)

  if(use_name_database) n <- unname(nflreadr::player_name_mapping[n] %c% n)

  if(lowercase) n <- tolower(n)

  n
}

#' Clean Home/Away in dataframes into Team/Opponent dataframes
#'
#' This function converts dataframes with "home_" and "away_" prefixed columns to "team_" and "opponent_", and doubles the rows. This makes sure that there's one row for each team (as opposed to one row for each game).
#'
#' @param dataframe dataframe
#' @param invert a character vector of columns that gets inverted when referring to the away team (e.g. home spread = 1 gets converted to away_spread = -1)
#'
#' @examples
#' \donttest{
#' # creating a small example dataframe!
#' cols <- c("season", "week", "home_team", "home_score",
#'           "away_team", "away_score", "result", "spread_line")
#'
#' x <- as.data.frame(load_schedules(2020))
#' x <- utils::head(x[cols])
#'
#' # how the data looks like
#' x
#'
#' clean_homeaway(x, invert = c("result","spread_line"))
#' }
#' @return a dataframe with one row per team (twice as long as the input dataframe)
#' @export
clean_homeaway <- function(dataframe, invert = NULL){
  stopifnot(
    is.data.frame(dataframe),
    is.null(invert)||is.character(invert)
  )
  dataframe$.row_order <- seq_len(nrow(dataframe))
  home <- dataframe
  away <- dataframe

  names(home) <- gsub(x = names(home), pattern = "^home_", replacement = "team_")
  names(home) <- gsub(x = names(home), pattern = "^away_", replacement = "opponent_")
  names(home) <- gsub(x = names(home), pattern = "team_team", replacement = "team")
  names(home) <- gsub(x = names(home), pattern = "opponent_team", replacement = "opponent")
  home$location <- data.table::fifelse(home$location == "Neutral", "neutral", "home", "home")

  names(away) <- gsub(x = names(away), pattern = "^away_", replacement = "team_")
  names(away) <- gsub(x = names(away), pattern = "^home_", replacement = "opponent_")
  names(away) <- gsub(x = names(away), pattern = "team_team", replacement = "team")
  names(away) <- gsub(x = names(away), pattern = "opponent_team", replacement = "opponent")
  away$location <- data.table::fifelse(home$location == "Neutral", "neutral", "away", "away")

  if(!is.null(invert)) data.table::setDF(away); away[,c(invert)] <- away[,c(invert)] * -1

  .row_order <- NULL
  out <- data.table::rbindlist(list(home,away), use.names = TRUE)[order(.row_order),-c(".row_order")]

  # we want to preserve the input class(es)
  class(out) <- class(dataframe)

  # input attributes shall be presrved mostly so we gotta do some acrobatic
  # and combine input attributes with new attributes
  df_attrs <- attributes(dataframe)
  df_attrs <- df_attrs[setdiff(names(df_attrs), c("row.names","names",".internal.selfref"))]
  out_attrs <- attributes(out)[c("names","row.names",".internal.selfref")]
  attributes(out) <- c(out_attrs, df_attrs)

  # the input may or may not have the nflverse_type attribute
  # if it is available, we'll add "by team" to make clear it's a different
  # nflverse_type
  if ("nflverse_type" %in% names(attributes(out))){
    attr(out, "nflverse_type") <- paste(attr(out, "nflverse_type"), "by team")
  }
  out
}
