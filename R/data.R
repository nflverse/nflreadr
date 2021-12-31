#' Data Dictionary: Play by Play
#'
#' A dataframe containing the data dictionary for [`load_pbp()`]
#'
#' @seealso `vignette("Data Dictionary - PBP")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_pbp.html>
"dictionary_pbp"

#' Data Dictionary: Player Stats
#'
#' A dataframe containing the data dictionary for [`load_player_stats()`]
#'
#' @seealso `vignette("Data Dictionary - Player Stats")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_player_stats.html>
"dictionary_player_stats"

#' Data Dictionary: Fantasy Player IDs
#'
#' A dataframe containing the data dictionary for [`load_ff_playerids()`]
#'
#' @seealso `vignette("Data Dictionary - FF Player IDs")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_ff_playerids.html>
"dictionary_ff_playerids"

#' Data Dictionary: Fantasy Football Rankings
#'
#' A dataframe containing the data dictionary for [`load_ff_rankings()`]
#'
#' @seealso `vignette("Data Dictionary - FF Rankings")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_ff_rankings.html>
"dictionary_ff_rankings"

#' Data Dictionary: Rosters
#'
#' A dataframe containing the data dictionary for [`load_rosters()`]
#'
#' @seealso `vignette("Data Dictionary - Rosters")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_rosters.html>
"dictionary_rosters"

#' Data Dictionary: Schedules
#'
#' A dataframe containing the data dictionary for [`load_schedules()`]
#'
#' @seealso `vignette("Data Dictionary - Schedules")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_schedules.html>
"dictionary_schedules"

#' Data Dictionary: Next Gen Stats
#'
#' A dataframe containing the data dictionary for [`load_nextgen_stats()`]
#'
#' @seealso `vignette("Data Dictionary - Next Gen Stats")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_nextgen_stats.html>
#'
"dictionary_nextgen_stats"

#' Data Dictionary: PFR Passing
#'
#' A dataframe containing the data dictionary for [`load_pfr_passing()`]
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_pfr_passing.html>
#' @seealso `vignette("Data Dictionary - PFR Passing")`
"dictionary_pfr_passing"

#' Data Dictionary: Draft Picks
#'
#' A dataframe containing the data dictionary for [`load_draft_picks()`]
#'
#' @seealso `vignette("Data Dictionary - Draft Picks")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_draft_picks.html>
"dictionary_draft_picks"

#' Data Dictionary: Snap Counts
#'
#' A dataframe containing the data dictionary for [`load_snap_counts()`]
#'
#' @seealso `vignette("Data Dictionary - Snap Counts")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_snap_counts.html>
"dictionary_snap_counts"

#' Data Dictionary: ESPN QBR
#'
#' A dataframe containing the data dictionary for [`load_espn_qbr()`]
#'
#' @seealso `vignette("Data Dictionary - ESPN QBR")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_espn_qbr.html>
"dictionary_espn_qbr"

#' Alternate player name mappings
#'
#' A named character vector mapping common alternate names, re-exported from `ffscrapr`.
#'
#' You can suggest additions to this table by [opening an issue in ffscrapr](https://github.com/ffverse/ffscrapr/issues/new/choose).
#'
#' @examples
#' \donttest{
#' player_name_mapping[c("Chatarius Atwell", "Robert Kelley")]
#' }
#'
#' @format A named character vector
#' \describe{
#'   \item{name attribute}{The "alternate" name.}
#'   \item{value attribute}{The "correct" name.}
#' }
"player_name_mapping"

#' Alternate team abbreviation mappings
#'
#' A named character vector mapping common alternate team abbreviations.
#'
#' You can suggest additions to this table by [opening an issue in nflreadr](https://github.com/nflverse/nflreadr/issues/new/choose).
#'
#' @examples
#' \donttest{
#' team_abbr_mapping[c("STL", "OAK","CRD","BLT", "CLV")]
#' }
#'
#' @seealso `team_abbr_mapping_norelocate` for the same thing but relocations stay in their original cities.
#'
#' @format A named character vector
#' \describe{
#'   \item{name attribute}{The "alternate" name.}
#'   \item{value attribute}{The "correct" name.}
#' }
"team_abbr_mapping"

#' Alternate team abbreviation mappings, no relocation
#'
#' A named character vector mapping common alternate team abbreviations, but does not follow relocations to their current city.
#'
#' You can suggest additions to this table by [opening an issue in nflreadr](https://github.com/nflverse/nflreadr/issues/new/choose).
#'
#' @examples
#' \donttest{
#' team_abbr_mapping_norelocate[c("STL", "OAK","CRD","BLT", "CLV")]
#' }
#'
#' @format A named character vector
#' \describe{
#'   \item{name attribute}{The "alternate" name.}
#'   \item{value attribute}{The "correct" name.}
#' }
"team_abbr_mapping_norelocate"
