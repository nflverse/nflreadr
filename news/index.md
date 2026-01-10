# Changelog

## nflreadr (development version)

- [`load_teams()`](https://nflreadr.nflverse.com/reference/load_teams.md)
  now accepts the argument `file_type` and respects the option
  `"nflreadr.prefer"`.
- [`nflverse_releases()`](https://nflreadr.nflverse.com/reference/nflverse_releases.md)
  and
  [`nflverse_download()`](https://nflreadr.nflverse.com/reference/nflverse_download.md)
  now correctly work with tag names to find releases.
  ([\#296](https://github.com/nflverse/nflreadr/issues/296))

## nflreadr 1.5.0

CRAN release: 2025-09-02

This release covers changes released before the start of the 2025 NFL
season.

### Breaking Changes

- [`load_players()`](https://nflreadr.nflverse.com/reference/load_players.md)
  now loads v2 nflverse players data. This is a breaking change as some
  variables have been removed or renamed. Please see the [data
  comparison](https://github.com/nflverse/nflverse-players?tab=readme-ov-file#whats-new-in-players-v2)
  for more details.
- [`load_player_stats()`](https://nflreadr.nflverse.com/reference/load_player_stats.md)
  now access new player_stats files created by
  `nflfastR::calculate_stats()`
  ([\#279](https://github.com/nflverse/nflreadr/issues/279)) and has a
  few function signature changes:
  - `stat_type` argument is deprecated - now returns offense, defense,
    and kicking player statistics as one file.
  - gains a new argument `summary_level` so that it can return player
    stats summarized by week, regular season, postseason, or regular +
    postseason combined
- [`load_team_stats()`](https://nflreadr.nflverse.com/reference/load_team_stats.md)
  added to access new team_stats files created by
  `nflfastR::calculate_stats()`
  ([\#279](https://github.com/nflverse/nflreadr/issues/279))
- [`load_depth_charts()`](https://nflreadr.nflverse.com/reference/load_depth_charts.md)
  now provides depth charts by date (including the preseason), and
  defaults to `most_recent_season(roster = TRUE)`, rather than
  `most_recent_season(roster = FALSE)`. Please note that the [data
  structure](https://nflreadr.nflverse.com/articles/dictionary_depth_charts.html)
  has changed because the data source had to be changed from NFL Data
  Exchange to ESPN.
  ([\#275](https://github.com/nflverse/nflreadr/issues/275),
  [\#277](https://github.com/nflverse/nflreadr/issues/277))
- [`load_participation()`](https://nflreadr.nflverse.com/reference/load_participation.md)
  is back, somewhat! FTNData.com has graciously offered to provide
  participation data after each season has ended, so we now have
  participation data from 2024 and 2023. Please note that this data is
  licensed under CC-BY-SA 4.0 and should be credited (for 2023 onwards)
  to **FTN Data via nflverse**.
  ([\#278](https://github.com/nflverse/nflreadr/issues/278))
- Now requires a minimum R version of 4.1.0, to align with the
  tidyverse’s [version
  support](https://www.tidyverse.org/blog/2019/04/r-version-support/)
  policies.

### Other Changes

- nflreadr now exports the variable
  [`nflreadr::nflverse_data_timezone`](https://nflreadr.nflverse.com/reference/nflverse_data_timezone.md)
  which defines the standard timezone across all nflverse data. When
  printing to the console, nflreadr will convert timestamps to the user
  local timezone.
- Added several player name mappings
  ([\#249](https://github.com/nflverse/nflreadr/issues/249),
  [\#253](https://github.com/nflverse/nflreadr/issues/253),
  [\#255](https://github.com/nflverse/nflreadr/issues/255),
  [\#270](https://github.com/nflverse/nflreadr/issues/270))
- Added a dictionary to describe what each shorthand roster status
  indicates ([\#232](https://github.com/nflverse/nflreadr/issues/232))
- [`clean_team_abbrs()`](https://nflreadr.nflverse.com/reference/clean_team_abbrs.md)
  now converts `"PHO"` to `"ARI"`.
  ([\#260](https://github.com/nflverse/nflreadr/issues/260))
- Improved description of next score probability variables in
  [`nflreadr::dictionary_pbp`](https://nflreadr.nflverse.com/reference/dictionary_pbp.md).
  ([\#262](https://github.com/nflverse/nflreadr/issues/262))
- `.sitrep` and all `*_sitrep` functions now redact nflfastR option
  paths. ([\#263](https://github.com/nflverse/nflreadr/issues/263))
- [`clean_team_abbrs()`](https://nflreadr.nflverse.com/reference/clean_team_abbrs.md)
  now converts full team names like `"Los Angeles Chargers"` or team
  nicknames like `"Bills"` to corresponding team abbreviations (`"LAC"`
  and `"BUF"` in this example).
  ([\#269](https://github.com/nflverse/nflreadr/issues/269))
- [`get_current_week()`](https://nflreadr.nflverse.com/reference/get_current_week.md)
  now passes arguments on to
  [`most_recent_season()`](https://nflreadr.nflverse.com/reference/latest_season.md).
  ([\#272](https://github.com/nflverse/nflreadr/issues/272))

Thank you to [@christianlohr9](https://github.com/christianlohr9),
[@Glumdar](https://github.com/Glumdar),
[@JanCalalo](https://github.com/JanCalalo),
[@john-b-edwards](https://github.com/john-b-edwards),
[@johnathan-o-h-napier](https://github.com/johnathan-o-h-napier),
[@LearnThinkCreate](https://github.com/LearnThinkCreate),
[@marvin3FF](https://github.com/marvin3FF),
[@mrcaseb](https://github.com/mrcaseb),
[@sdb-208](https://github.com/sdb-208),
[@tcash21](https://github.com/tcash21),
[@TheMathNinja](https://github.com/TheMathNinja), and
[@wyaruss](https://github.com/wyaruss) for their questions, feedback,
and contributions towards this release.

------------------------------------------------------------------------

## nflreadr 1.4.1

CRAN release: 2024-07-29

This release covers a number of bugfixes and function improvements:

- `%c%` internal helper now uses
  [`data.table::fifelse()`](https://rdatatable.gitlab.io/data.table/reference/fifelse.html)
  to avoid falsely converting dates to integers.
  ([\#214](https://github.com/nflverse/nflreadr/issues/214))
- [`load_schedules()`](https://nflreadr.nflverse.com/reference/load_schedules.md)
  cleans the `roof` variable in order to avoid nflverse model issues.
  ([\#218](https://github.com/nflverse/nflreadr/issues/218))
- [`join_coalesce()`](https://nflreadr.nflverse.com/reference/join_coalesce.md)
  coerces x/y args to data.frame and will return a data.frame
- [`most_recent_season()`](https://nflreadr.nflverse.com/reference/latest_season.md)
  now internally computes the exact day of the season opener as Thursday
  after first Monday of September.
  ([\#221](https://github.com/nflverse/nflreadr/issues/221))
- [`load_espn_qbr()`](https://nflreadr.nflverse.com/reference/load_espn_qbr.md)
  no longer supports argument `league` which used to allow loading of
  College QBR (not in nflverse scope)
  ([\#222](https://github.com/nflverse/nflreadr/issues/222))
- New function
  [`stat_mode()`](https://nflreadr.nflverse.com/reference/stat_mode.md),
  a re-export from nflfastR, which computes the statistical mode of a
  vector. ([\#224](https://github.com/nflverse/nflreadr/issues/224))
- [`load_ftn_charting()`](https://nflreadr.nflverse.com/reference/load_ftn_charting.md)
  now accepts the argument `file_type`.
  ([\#228](https://github.com/nflverse/nflreadr/issues/228))
- [`clean_team_abbrs()`](https://nflreadr.nflverse.com/reference/clean_team_abbrs.md)
  now accepts the “team” name “NFL”.
  ([\#231](https://github.com/nflverse/nflreadr/issues/231))
- [`load_participation()`](https://nflreadr.nflverse.com/reference/load_participation.md)
  now returns additional fields `time_to_throw`, `was_pressure`,
  `defense_man_zone_type`, and `defense_coverage_type`
  ([\#233](https://github.com/nflverse/nflreadr/issues/233), thank you
  [@mistakia](https://github.com/mistakia)
  [@john-b-edwards](https://github.com/john-b-edwards))
- [`clean_player_names()`](https://nflreadr.nflverse.com/reference/clean_player_names.md)
  now can transliterate to latin-ascii if the stringi package is
  available, controlled by the `convert_to_ascii` argument.

Thank you to: [@arjunmenon10](https://github.com/arjunmenon10),
[@engineerchange](https://github.com/engineerchange),
[@isaactpetersen](https://github.com/isaactpetersen),
[@Jeffery-777](https://github.com/Jeffery-777),
[@john-b-edwards](https://github.com/john-b-edwards),
[@justlikekevin](https://github.com/justlikekevin),
[@mrcaseb](https://github.com/mrcaseb),
[@SCasanova](https://github.com/SCasanova), and
[@tanho63](https://github.com/tanho63) for their questions, feedback,
and contributions to this release.

------------------------------------------------------------------------

## nflreadr 1.4.0

CRAN release: 2023-09-05

This release addresses bugs, improves some utilities, and adds a few new
datasets.

### New Datasets

- `load_player_stats(stat_type = "defense")` added to provide defensive
  player stats as computed by `nflfastR::calculate_player_stats_def()`
  ([\#200](https://github.com/nflverse/nflreadr/issues/200)) It also
  comes with a data dictionary, courtesy of
  [@mpcen](https://github.com/mpcen)
  ([\#192](https://github.com/nflverse/nflreadr/issues/192))
- [`load_ftn_charting()`](https://nflreadr.nflverse.com/reference/load_ftn_charting.md)
  adds manual charting data for 2022-onwards, graciously provided by
  [FTN Data](https://ftnfantasy.com/stats/sports-data). This should
  automatically be updated when published by FTN, and the early
  indication is that it will be within 48 hours after a game has
  finished.

### Function Improvements

- [`nflverse_sitrep()`](https://nflreadr.nflverse.com/reference/sitrep.md)
  and friends overhauled:
  - now returns a list of sitrep attributes rather than only printing to
    console (for programmatic use)
  - now checks CRAN and r-universe to tell you if your installation is
    behind cran or devel
  - now handles dependencies for nflverse/ffverse packages that are not
    on CRAN
- [`nflreadr::most_recent_season()`](https://nflreadr.nflverse.com/reference/latest_season.md)
  and aliases `get_latest_season`, `get_current_season` etc now use
  March 15th as the changeover for league year. Hopefully this is not a
  moving target 🙃
- [`nflreadr::clean_homeaway()`](https://nflreadr.nflverse.com/reference/clean_homeaway.md)
  now handles columns with suffixes `_home` and `_away`
- [`nflreadr::nflverse_game_id()`](https://nflreadr.nflverse.com/reference/nflverse_game_id.md)
  now accepts old team abbreviations and outputs useful errors.
- Added
  [`.for_cran()`](https://nflreadr.nflverse.com/reference/dot-for_cran.md)
  to limit parallelization in CRAN examples and tests
- `make_nflverse_data_class()` now uses
  [`data.table::setattr()`](https://rdatatable.gitlab.io/data.table/reference/setattr.html)
  to preserve data.table pointer

### Dictionary updates

- Clarified description of the `"special"` variable in the play-by-play
  data dictionary.
  ([\#189](https://github.com/nflverse/nflreadr/issues/189))

Thank you to [@ak47twq](https://github.com/ak47twq),
[@alecglen](https://github.com/alecglen),
[@andycancapital](https://github.com/andycancapital),
[@bullaspc](https://github.com/bullaspc),
[@mcarman8](https://github.com/mcarman8),
[@mpcen](https://github.com/mpcen),
[@mrcaseb](https://github.com/mrcaseb),
[@tanho63](https://github.com/tanho63),
[@tashapiro](https://github.com/tashapiro), and
[@TheMathNinja](https://github.com/TheMathNinja) for their questions,
feedback, and contributions to this release.

–

## nflreadr 1.3.2

CRAN release: 2023-01-06

Minor changes per changelist and patch CRAN-related example issue.

### Changes

- [`.clear_cache()`](https://nflreadr.nflverse.com/reference/clear_cache.md)
  now re-exported without dot prefix as
  [`clear_cache()`](https://nflreadr.nflverse.com/reference/clear_cache.md).
  Hopefully more obvious.
- [`join_coalesce()`](https://nflreadr.nflverse.com/reference/join_coalesce.md)
  is now added as a utility to join two dataframes and coalesce any
  shared columns.
- [`load_teams()`](https://nflreadr.nflverse.com/reference/load_teams.md)
  now uses the argument `current` (TRUE/FALSE) to standardize which rows
  are returned - this aligns with
  [`nflreadr::clean_team_abbrs`](https://nflreadr.nflverse.com/reference/clean_team_abbrs.md)
  and
  [`nflreadr::team_abbr_mapping`](https://nflreadr.nflverse.com/reference/team_abbr_mapping.md)
- `dictionary_participation` added (thank you
  [@josephhero](https://github.com/josephhero)!)
- [`clean_homeaway()`](https://nflreadr.nflverse.com/reference/clean_homeaway.md)
  now preserves neutral site location as well as input class and input
  attributes
- [`load_ff_rankings()`](https://nflreadr.nflverse.com/reference/load_ff_rankings.md)
  URL bug corrected (thank you
  [@kharigardner](https://github.com/kharigardner))
- test and example for
  [`clean_homeaway()`](https://nflreadr.nflverse.com/reference/clean_homeaway.md)
  resolved for CRAN failure

Thank you to [@ak47twq](https://github.com/ak47twq),
[@bachlaw](https://github.com/bachlaw),
[@brunomioto](https://github.com/brunomioto),
[@guga31bb](https://github.com/guga31bb),
[@Josephhero](https://github.com/Josephhero),
[@kharigardner](https://github.com/kharigardner),
[@mrcaseb](https://github.com/mrcaseb),
[@MysteryPollster](https://github.com/MysteryPollster),
[@numbersinfigures](https://github.com/numbersinfigures), and
[@ohri](https://github.com/ohri) for their questions, feedback, and
contributions towards this release.

------------------------------------------------------------------------

## nflreadr 1.3.1

CRAN release: 2022-09-25

Fixes CRAN bug and provides some function improvements, most notably
improved logic for
[`load_participation()`](https://nflreadr.nflverse.com/reference/load_participation.md)’s
pbp join.

### New Features

- Added
  [`nflverse_game_id()`](https://nflreadr.nflverse.com/reference/nflverse_game_id.md)
  which computes valid nflverse game identifiers in the format
  `"{season}_{week}_{away}_{home}"`

### Function Updates

- [`load_participation()`](https://nflreadr.nflverse.com/reference/load_participation.md)
  now joins pbp on via `nflverse_game_id` instead of `old_game_id`
- [`load_snap_counts()`](https://nflreadr.nflverse.com/reference/load_snap_counts.md)
  now allows download of the 2012 season which was previously hardcoded
  from 2013 ([\#128](https://github.com/nflverse/nflreadr/issues/128))
- [`progressively()`](https://nflreadr.nflverse.com/reference/progressively.md)
  now works with purrr-style lambda functions and no longer checks for
  progressor class, allowing it to be used more flexibly (and with
  cli-based progress bars.)

### Bugfixes

- [`nflverse_releases()`](https://nflreadr.nflverse.com/reference/nflverse_releases.md)
  and
  [`nflverse_download()`](https://nflreadr.nflverse.com/reference/nflverse_download.md)
  now accept `.token` arguments which default to
  [`gh::gh_token()`](https://gh.r-lib.org/reference/gh_token.html). This
  is mostly to let us test things properly.
  ([\#131](https://github.com/nflverse/nflreadr/issues/131))
- Adjust import references per Jenny Bryan’s recommendations in
  hadley/r-pkgs#828 to avoid loading unused packages.
- [`clean_player_names()`](https://nflreadr.nflverse.com/reference/clean_player_names.md)
  now fully lives in nflreadr, the squish/trim happens first
- player name mapping update
- [`get_current_season()`](https://nflreadr.nflverse.com/reference/latest_season.md)
  now exists, because we can’t agree on what to name things.

Thank you to [@atungate](https://github.com/atungate),
[@grayhawk40](https://github.com/grayhawk40),
[@guga31bb](https://github.com/guga31bb),@jestarr,
[@john-b-edwards](https://github.com/john-b-edwards),@marvin3FF,@mrcaseb,
[@SCasanova](https://github.com/SCasanova),
[@shirondru](https://github.com/shirondru),
[@tanho63](https://github.com/tanho63), and
[@TheMathNinja](https://github.com/TheMathNinja) for their contributions
and feedback towards this release!

------------------------------------------------------------------------

## nflreadr 1.3.0

CRAN release: 2022-08-06

This release introduces several new data functions, some new utilities,
and an array of data/function updates.

### New Data!

- [`load_participation()`](https://nflreadr.nflverse.com/reference/load_participation.md)
  returns new play-level information about what players are on the
  field, how many players are in the box, and what formation the offense
  is using. Data from NGS starting 2016 and onward
- [`load_contracts()`](https://nflreadr.nflverse.com/reference/load_contracts.md)
  downloads (historical) player contracts from
  [OverTheCap.com](https://overthecap.com/contract-history)
- [`load_players()`](https://nflreadr.nflverse.com/reference/load_players.md)
  returns player-level information and is the new recommended source
  (over rosters) for IDs, positions, birthdates etc.
- [`load_rosters_weekly()`](https://nflreadr.nflverse.com/reference/load_rosters_weekly.md)
  provides week-by-week team rosters dating back to 2002.
- [`load_officials()`](https://nflreadr.nflverse.com/reference/load_officials.md)
  returns game-level information about which officials are assigned to
  specific games.

### New Functions!

- [`nflverse_download()`](https://nflreadr.nflverse.com/reference/nflverse_download.md)
  downloads all files attached to specified/all releases to a local
  folder. This facilitates something like
  [`arrow::open_dataset()`](https://arrow.apache.org/docs/r/reference/open_dataset.html)
  for reading files locally.
- [`nflverse_releases()`](https://nflreadr.nflverse.com/reference/nflverse_releases.md)
  lists all releases that can be loaded through
  [`nflverse_download()`](https://nflreadr.nflverse.com/reference/nflverse_download.md)
- [`load_from_url()`](https://nflreadr.nflverse.com/reference/load_from_url.md)
  exposes a new utility function for loading any csv, rds, qs, parquet
  URL to memory.

### Function Updates!

- [`load_draft_picks()`](https://nflreadr.nflverse.com/reference/load_draft_picks.md)
  now has the rest of the career stat fields from PFR
- `*sitrep()` functions now report package-specific options that are
  set.
- [`get_current_week()`](https://nflreadr.nflverse.com/reference/get_current_week.md)
  helper to get the current nfl season week
- [`load_rosters()`](https://nflreadr.nflverse.com/reference/load_rosters.md)
  now provides season-level rosters dating back to 1920.

### Other bugfixes

- moved rbindlist to a helper that manages attributes better
- update `dictionary_snap_counts` and `dictionary_schedules` with some
  missing fields
- rewrite from_url error messages to use cli and improve usefulness
- bump minimum rlang version to 1.0.0
- add piggyback suggested dependency
- Export old class to support S4/DBI/`nflfastR::update_db()` as if it
  were a tibble
- Fix exportOldClass so that it supports only data.frame stuff? we have
  no idea,,,
- `options(nflreadr.prefer)` defaults to rds now since qs is no longer a
  required dependency
- [`clean_player_names()`](https://nflreadr.nflverse.com/reference/clean_player_names.md)
  now also removes commas (after optionally using them for
  `convert_lastfirst`)
- [`clean_player_names()`](https://nflreadr.nflverse.com/reference/clean_player_names.md)
  now also removes all caps suffixes
- dictionary updates: return labelled.
- [`.sitrep()`](https://nflreadr.nflverse.com/reference/sitrep.md) exits
  nicely if no packages are to be investigated.
  [\#114](https://github.com/nflverse/nflreadr/issues/114)
- refactored all the loaders to use `load_from_url` as primary
- fixed broken example in
  [`load_ff_opportunity()`](https://nflreadr.nflverse.com/reference/load_ff_opportunity.md)
  documentation.
  [\#117](https://github.com/nflverse/nflreadr/issues/117)

Thank you to [@albtree](https://github.com/albtree),
[@john-b-edwards](https://github.com/john-b-edwards),
[@mrcaseb](https://github.com/mrcaseb),
[@pranavrajaram](https://github.com/pranavrajaram),
[@tanho63](https://github.com/tanho63), and
[@tpenney89](https://github.com/tpenney89) for their contributions and
feedback on this release!

------------------------------------------------------------------------

## nflreadr 1.2.0

CRAN release: 2022-03-17

This release updates all nflverse URLs to use the new [nflverse-data
repository](https://github.com/nflverse/nflverse-data) releases, as well
as provides improved pretty-printing methods that tell you when the data
was last updated.

------------------------------------------------------------------------

## nflreadr 1.1.3

CRAN release: 2022-01-28

This release adds functions and arguments to access new data, along with
some backend changes.

### New data and functions

- [`load_ff_opportunity()`](https://nflreadr.nflverse.com/reference/load_ff_opportunity.md)
  downloads expected fantasy points data from the [ffopportunity
  package](https://ffopportunity.ffverse.com)
- [`load_ff_rankings()`](https://nflreadr.nflverse.com/reference/load_ff_rankings.md)
  gains an `"all"` parameter to return all available rankings data
  (weekly archives since 2019)
- [`load_pfr_advstats()`](https://nflreadr.nflverse.com/reference/load_pfr_advstats.md)
  gains a `"summary_level"` parameter to return season-level data, which
  has some fields that are not available at the week-level.

### Backend

- `options(nflreadr.verbose)` replaces `options(nflreadr.cache_warning)`
  as the best way to silence nflreadr messages.
- Improved data dictionaries for ESPN QBR, Injuries, Trades, Depth
  Charts, and Combine
- Exported
  [`most_recent_season()`](https://nflreadr.nflverse.com/reference/latest_season.md)
  function
- Updated documentation with improved linking and where to file data
  issues.
- Sitrep functions have ffopportunity and nflverse packages.
- Pkgdown site upgraded to Bootstrap 5.

Thank you to [@armstjc](https://github.com/armstjc),
[@Grayhawk34](https://github.com/Grayhawk34),
[@john-b-edwards](https://github.com/john-b-edwards),
[@mrcaseb](https://github.com/mrcaseb),
[@pranavrajaram](https://github.com/pranavrajaram),
[@rogers1000](https://github.com/rogers1000), and
[@tanho63](https://github.com/tanho63) for their contributions and
feedback on this release!

------------------------------------------------------------------------

## nflreadr 1.1.2

CRAN release: 2021-12-08

### New Functions

- [`nflverse_sitrep()`](https://nflreadr.nflverse.com/reference/sitrep.md)
  and
  [`ffverse_sitrep()`](https://nflreadr.nflverse.com/reference/sitrep.md)
  give a minimal overview of the package dependencies
- Minimum R version bumped to R 3.6.0 - this is the minimum version
  required to read the [current RDS
  file-version](https://stat.ethz.ch/R-manual/R-devel/library/base/html/readRDS.html).
- `_sitrep()` functions receive a small print-related bugfix and
  colouring improvement.

------------------------------------------------------------------------

## nflreadr 1.1.1

CRAN release: 2021-10-05

### New Data and Functions

- [`clean_player_names()`](https://nflreadr.nflverse.com/reference/clean_player_names.md)
  and
  [`clean_team_abbrs()`](https://nflreadr.nflverse.com/reference/clean_team_abbrs.md)
  added - these help standardise player names and team abbreviations
  based on internal dictionaries.
- [`load_ff_rankings()`](https://nflreadr.nflverse.com/reference/load_ff_rankings.md)
  now has a `type` argument and can return `"draft"` or `"week"`
  rankings from the DynastyProcess/data repo.
- [`clean_homeaway()`](https://nflreadr.nflverse.com/reference/clean_homeaway.md)
  converts a dataframe of games with columns prefixed with `home_` and
  `away_` to a dataframe of teams, renaming to `team_` and `opponent_`
  and doubling the rows.
- Added
  [`load_pfr_advstats()`](https://nflreadr.nflverse.com/reference/load_pfr_advstats.md)
  which provides pass, rush, rec, def additional data for each week.

### Bug Fixes

- Add Rcpp and RcppParallel minimum dependencies to fix qs issues.
- Added a message that reminds the user of the caching behavior. The
  message will be displayed once every 8 hours if the session is
  interactive.
- Adjusted file location of snap count data

Thank you to [@ajreinhard](https://github.com/ajreinhard),
[@brunomioto](https://github.com/brunomioto),
[@jthomasmock](https://github.com/jthomasmock),
[@mrcaseb](https://github.com/mrcaseb),
[@SCasanova](https://github.com/SCasanova), and
[@tanho63](https://github.com/tanho63) for their feedback and
contributions to this package!

------------------------------------------------------------------------

## nflreadr 1.1.0

CRAN release: 2021-09-02

This release makes some backend changes for speed, reduced dependency
footprint, and ease of maintenance.

### New Data

- [`load_player_stats()`](https://nflreadr.nflverse.com/reference/load_player_stats.md)
  can now retrieve weekly summaries of kicking data by specifying the
  `stat_type` argument to be `"kicking"`.
- [`load_combine()`](https://nflreadr.nflverse.com/reference/load_combine.md)
  retrieves NFL combine data (from PFR).

### Backend Changes

- Remove progress handling from `*_from_url()` family of functions and
  move responsibility to
  [`progressively()`](https://nflreadr.nflverse.com/reference/progressively.md)
  function decorator instead. See vignette for details.
- Removed dependency on `dplyr` and `purrr` in favour of `data.table` -
  this hopefully improves speed and reduces the dependency footprint.
- Uses
  [`rlang::arg_match0`](https://rlang.r-lib.org/reference/arg_match.html)
  instead of match.arg (uses rlang explicitly instead of implicitly as a
  dependency of memoise).

------------------------------------------------------------------------

## nflreadr 1.0.0

CRAN release: 2021-08-09

The goal of {`nflreadr`} is to efficiently load data from [nflverse
GitHub repositories](https://github.com/nflverse), and features caching,
optional progress updates, and data dictionaries.

At this time, it includes data from the following repositories:

- [nflverse/nflverse-pbp](https://github.com/nflverse/nflverse-pbp)
- [nflverse/nfldata](https://github.com/nflverse/nfldata)
- [nflverse/nflverse-rosters](https://github.com/nflverse/nflverse-rosters)
- [nflverse/espnscrapeR-data](https://github.com/nflverse/espnscrapeR-data)
- [nflverse/nflverse-pfr](https://github.com/nflverse/nflverse-pfr)
- [dynastyprocess/data](https://github.com/dynastyprocess/data)

This will hopefully provide a unified and reliable package for
downloading nflverse data that can be extended to the rest of the
nflverse and ffverse package families.

Special thanks to Seb, Ben, John, Lee, and Thomas for their
contributions to the package and to the data pipelines that this package
relies on 🎉
