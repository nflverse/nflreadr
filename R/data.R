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

#' Data Dictionary: Team Stats
#'
#' A dataframe containing the data dictionary for [`load_team_stats()`]
#'
#' @seealso `vignette("Data Dictionary - Team Stats")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_team_stats.html>
"dictionary_team_stats"

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

#' Data Dictionary: Expected Fantasy Points
#'
#' A dataframe containing the data dictionary for [`load_ff_opportunity()`]
#'
#' @seealso `vignette("Data Dictionary - Expected Fantasy Points")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_ff_opportunity.html>
"dictionary_ff_opportunity"

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

#' Data Dictionary: Combine
#'
#' A dataframe containing the data dictionary for [`load_combine()`]
#'
#' @seealso `vignette("Data Dictionary - Combine")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_combine.html>
"dictionary_combine"

#' Data Dictionary: Injuries
#'
#' A dataframe containing the data dictionary for [`load_injuries()`]
#'
#' @seealso `vignette("Data Dictionary - Injuries")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_injuries.html>
"dictionary_injuries"

#' Data Dictionary: Depth Charts
#'
#' A dataframe containing the data dictionary for [`load_depth_charts()`]
#'
#' @seealso `vignette("Data Dictionary - Depth Charts")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_depth_charts.html>
"dictionary_depth_charts"

#' Data Dictionary: Trades
#'
#' A dataframe containing the data dictionary for [`load_trades()`]
#'
#' @seealso `vignette("Data Dictionary - Trades")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_trades.html>
"dictionary_trades"

#' Data Dictionary: Contracts
#'
#' A dataframe containing the data dictionary for [`load_contracts()`]
#'
#' @seealso `vignette("Data Dictionary - Contracts")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_contracts.html>
"dictionary_contracts"

#' Data Dictionary: Participation
#'
#' A dataframe containing the data dictionary for [`load_participation()`]
#'
#' @seealso `vignette("Data Dictionary - Participation")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_participation.html>
"dictionary_participation"

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

#' nflverse Timezone
#'
#' A character string defining the default timezone for data across the nflverse
#'
"nflverse_data_timezone"

#' dictionary_roster_status
#'
#' A dictionary translating the shorthand roster status to more verbose explanations of what each status indicates.
"dictionary_roster_status"

#' Data Dictionary: Players
#'
#' A dataframe containing the data dictionary for [`load_players()`]
#'
#' @seealso `vignette("Data Dictionary - Players")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_players.html>
"dictionary_players"
