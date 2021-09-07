#' Standardise NFL team abbreviations
#'
#' This function standardises NFL team abbreviations to nflverse defaults.
#' This helps for joins and plotting, especially with the new nflplotR package!
#'
#' @param abbr a character vector of abbreviations
#'
#' @return
#' @export
#'
#' @examples
#' {
#' x <- c("LVR","PIE","LAC","PIT")
#' clean_team_abbr(x)
#' }
clean_team_abbr <- function(abbr){
  stopifnot(is.character(abbr))

  x <- unname(nflreadr::map_team_abbrs[abbr])

  if(any(is.na(x))) {
    warning(paste(abbr[is.na(x)],collapse = ";")," not found in `nflreadr::nfl_team_abbrs` mapping!")
  }

  x
}

#' Create player merge names
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
#' clean_player_names(c("A.J. Green", "Odell Beckham Jr.", "Le'Veon Bell Sr."), lowercase = TRUE, use_name_database = FALSE)
#'
#' clean_player_names(c("Trubisky,      Mitch", "Atwell, Chatarius", "Elliott, Zeke", "Elijah Moore"),
#'                   convert_lastfirst = TRUE,
#'                   use_name_database = FALSE)
#'
#' @export
clean_player_names <- function(player_name,
                              lowercase = FALSE,
                              convert_lastfirst = TRUE,
                              use_name_database = TRUE){

  stopifnot(is.character(player_name),
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

  if(use_name_database) n <- unname(nflreadr::map_player_names[n] %||% n)

  if(lowercase) n <- tolower(n)

  n
}
