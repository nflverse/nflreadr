#import nflreadpy as nrp  # if using python; or use nflreadr in R
import pandas as pd

# 1) load week 2 & week 3 player stats
#   assuming nflreadpy.load_player_stats returns a table with fields like:
#   player_display_name, position, team, week, passing_yards, passing_tds, interceptions,
#   rushing_yards, rushing_tds, receptions, receiving_yards, receiving_tds

stats = nrp.load_player_stats(seasons=[2025])
# filter to weeks 2 & 3
stats2 = stats[stats['week'].isin([2,3])].copy()

# 2) filter to rostered players (from your pull list)
pull = pd.read_csv("Rostered_Players_Weeks2_3_PullList.csv")
rostered = set(pull['Player'].tolist())
stats2 = stats2[stats2['player_display_name'].isin(rostered)].copy()

# 3) ownership maps
w2_own = pd.read_csv("Week2_Field_Ownership.csv")  # Player, FieldPct
w3_own = pd.read_csv("Week3_Field_Ownership.csv")

own2 = dict(zip(w2_own['Player'], w2_own['FieldPct']))
own3 = dict(zip(w3_own['Player'], w3_own['FieldPct']))

# 4) define DK scoring (no DST)
def dk_points(r):
    pts = 0
    pts += (r['passing_yards'] or 0)/25
    pts += (r['passing_tds'] or 0)*4
    pts -= (r['interceptions'] or 0)*1
    pts += (r['rushing_yards'] or 0)/10
    pts += (r['rushing_tds'] or 0)*6
    pts += (r['receptions'] or 0)*1
    pts += (r['receiving_yards'] or 0)/10
    pts += (r['receiving_tds'] or 0)*6

    # bonuses
    if r['passing_yards'] >= 300: pts += 3
    if r['rushing_yards'] >= 100: pts += 3
    if r['receiving_yards'] >= 100: pts += 3
    return pts

stats2['DKPts'] = stats2.apply(dk_points, axis=1)

# 5) mark sub-5% ownership
def mark_sub5(r):
    if r['week'] == 2:
        return own2.get(r['player_display_name'], 1000) < 5
    elif r['week'] == 3:
        return own3.get(r['player_display_name'], 1000) < 5
    else:
        return False

stats2['Sub5'] = stats2.apply(mark_sub5, axis=1)

# 6) join with your lineup Top-1% membership to tag which players were in Top-1% lineups
#    you will need an exploded lineup export: one row per (Entry, Player) for Top-1% / Field
lineups2 = pd.read_csv("Flicker_Week2_Lineups_Exploded.csv")  # EntryId, Top1 (0/1), Player
lineups3 = pd.read_csv("Flicker_Week3_Lineups_Exploded.csv")

# compute aggregates:

def summarize(df, lineups, week_label):
    # merge to tag which players in Top1 vs Field
    m = lineups[lineups['week']==week_label][['EntryId','Top1','Player']]
    dfw = df[df['week']==week_label]
    merged = dfw.merge(m, left_on='player_display_name', right_on='Player', how='inner')
    # sub-5% only
    merged = merged[merged['Sub5'] == True]
    # group by position
    out = merged.groupby('position').agg({
        'DKPts': ['mean','median',
                  lambda s: (s>=20).mean()*100,
                  lambda s: (s>=25).mean()*100,
                  lambda s: (s>=30).mean()*100]
    }).reset_index()
    out.columns = ['position','avg_pts','median_pts','pct_20+','pct_25+','pct_30+']
    out.insert(0, 'Sample', f"Week {week_label} Top-1% sub-5%")
    return out

sum2 = summarize(stats2, lineups2, 2)
sum3 = summarize(stats2, lineups3, 3)

# Similarly compute Field sample (all lineups) by excluding Top1 filter

# 7) combine and export to CSV

combined = pd.concat([sum2, sum3, ...], ignore_index=True)
combined.to_csv("Sub5_Position_Scoring_Comparisons_Final.csv", index=False)
 Load Player Level Stats
#'
#' @param seasons a numeric vector of seasons to return, defaults to most recent
#' season. If set to `TRUE`, returns all available data.
#' @inheritParams rlang::args_dots_empty
#' @param summary_level choice: one of week (default), "reg" for regular season,
#' "post" for postseason, "reg+post" for combined regular season + postseason stats
#' @param file_type choice: one of `c("rds", "qs", "csv", "parquet")`. Can also
#' be set globally with `options(nflreadr.prefer)`
#' @param stat_type `r lifecycle::badge("deprecated")` - now returns all stat
#' types by default
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#' try({
#'   load_player_stats()
#' })
#' }
#'
#' @return A tibble of player statistics that aims to match NFL official box
#' scores and season summaries
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_player_stats.html>
#' for a web version of the data dictionary
#' @seealso [`dictionary_player_stats`] for the data dictionary
#'
#' @export
load_player_stats <- function(
  seasons = most_recent_season(),
  ...,
  summary_level = c("week", "reg", "post", "reg+post"),
  file_type = getOption("nflreadr.prefer", default = "rds"),
  stat_type = lifecycle::deprecated()
) {
  # deprecate stat_type arg
  if (lifecycle::is_present(stat_type)) {
    lifecycle::deprecate_warn(
      when = "1.5.0",
      what = "load_player_stats(stat_type)",
      with = "load_player_stats()"
    )
  }

  load_stats(
    .stat_type = "player",
    seasons = seasons,
    ...,
    summary_level = summary_level,
    file_type = file_type
  )
}

#' Load Team Level Stats
#'
#' @param seasons a numeric vector of seasons to return, defaults to most recent
#' season. If set to `TRUE`, returns all available data.
#' @inheritParams rlang::args_dots_empty
#' @param summary_level choice: one of week (default), "reg" for regular season,
#' "post" for postseason, "reg+post" for combined regular + post season stats
#' @param file_type choice: one of `c("rds", "qs", "csv", "parquet")`. Can also
#' be set globally with `options(nflreadr.prefer)`
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#' try({
#'   load_team_stats()
#' })
#' }
#'
#' @return A tibble of team statistics that aims to match NFL official box scores
#' and season summaries
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_team_stats.html>
#' for a web version of the data dictionary
#' @seealso [`dictionary_team_stats`] for the data dictionary
#'
#' @export
load_team_stats <- function(
  seasons = most_recent_season(),
  ...,
  summary_level = c("week", "reg", "post", "reg+post"),
  file_type = getOption("nflreadr.prefer", default = "rds")
) {
  load_stats(
    .stat_type = "team",
    seasons = seasons,
    ...,
    summary_level = summary_level,
    file_type = file_type
  )
}

load_stats <- function(
  .stat_type = c("player", "team"),
  seasons,
  ...,
  summary_level = c("week", "reg", "post", "reg+post"),
  file_type = getOption("nflreadr.prefer", default = "rds")
) {
  # ensure that all function args except seasons and .stat_type are named
  rlang::check_dots_empty()

  .stat_type <- rlang::arg_match(.stat_type)
  summary_level <- rlang::arg_match(summary_level)
  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "qs", "parquet"))

  if (!isTRUE(seasons)) {
    stopifnot(
      is.numeric(seasons),
      seasons >= 1999,
      seasons <= most_recent_season()
    )
  }

  if (isTRUE(seasons)) {
    seasons <- 1999:most_recent_season()
  }

  summary_level <- switch(
    summary_level,
    "week" = "week_",
    "reg" = "reg_",
    "post" = "post_",
    "reg+post" = "regpost_"
  )

  url <- paste0(
    "https://github.com/nflverse/nflverse-data/releases/download/",
    "stats_",
    .stat_type,
    "/stats_",
    .stat_type,
    "_",
    summary_level,
    seasons,
    ".",
    file_type
  )

  out <- load_from_url(url, seasons = seasons, nflverse = TRUE)
  return(out)
}
