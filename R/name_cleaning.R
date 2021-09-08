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

  if (any(is.na(a))) {
    warning("Abbreviations not found in `nflreadr::team_abbr_mapping`: ", paste(utils::head(abbr[is.na(a)], 10), collapse = " , "))
  }

  if (isTRUE(keep_non_matches)) a[is.na(a)] <- abbr[is.na(a)]

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
#' clean_player_names(c("A.J. Green", "Odell Beckham Jr.", "Le'Veon Bell Sr."))
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

  # convert Last, First
  if(convert_lastfirst) n <- gsub(pattern = "^(.+), (.+)$", replacement = "\\2 \\1", x = n)

  # suffix removal
  n <- gsub(pattern = "( Jr\\.$)|( Sr\\.$)|( III$)|( II$)|( IV$)|( V$)|(\\')|(\\.)",
            replacement = "",
            x = n)

  # squish internal whitespace
  n <- gsub(pattern = "\\s+", replacement = " ", x = n)

  # trim whitespace
  n <- gsub(pattern = "^\\s|\\s$", replacement = "", x = n)

  if(use_name_database) n <- unname(nflreadr::player_name_mapping[n] %c% n)

  if(lowercase) n <- tolower(n)

  n
}
