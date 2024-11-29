# nflreadr (development version)

- nflreadr now exports the variable `nflreadr::nflverse_data_timezone` which defines the standard timezone
across all nflverse data. When printing to the console, nflreadr will convert timestamps to the user local timezone.
- Added several player name mappings (#249, #253, #255)
- Added a dictionary to describe what each shorthand roster status indicates (#232)
- `clean_team_abbrs()` now converts `"PHO"` to `"ARI"`. (#260)
- Improved description of next score probability variables in `nflreadr::dictionary_pbp`. (#262) 
- `.sitrep` and all `*_sitrep` functions now redact nflfastR option paths. (#263)

---

# nflreadr 1.4.1

This release covers a number of bugfixes and function improvements:

- `%c%` internal helper now uses `data.table::fifelse()` to avoid falsely converting 
dates to integers. (#214)
- `load_schedules()` cleans the `roof` variable in order to avoid nflverse model 
issues. (#218)
- `join_coalesce()` coerces x/y args to data.frame and will return a data.frame
- `most_recent_season()` now internally computes the exact day of the season 
opener as Thursday after first Monday of September. (#221)
- `load_espn_qbr()` no longer supports argument `league` which used to allow 
loading of College QBR (not in nflverse scope) (#222)
- New function `stat_mode()`, a re-export from nflfastR, which computes the 
statistical mode of a vector. (#224)
- `load_ftn_charting()` now accepts the argument `file_type`. (#228)
- `clean_team_abbrs()` now accepts the "team" name "NFL". (#231)
- `load_participation()` now returns additional fields `time_to_throw`, 
`was_pressure`, `defense_man_zone_type`, and `defense_coverage_type` (#233, 
thank you @mistakia @john-b-edwards)
- `clean_player_names()` now can transliterate to latin-ascii if the stringi package 
is available, controlled by the `convert_to_ascii` argument.

Thank you to: 
[&#x0040;arjunmenon10](https://github.com/arjunmenon10),
[&#x0040;engineerchange](https://github.com/engineerchange),
[&#x0040;isaactpetersen](https://github.com/isaactpetersen),
[&#x0040;Jeffery-777](https://github.com/Jeffery-777),
[&#x0040;john-b-edwards](https://github.com/john-b-edwards),
[&#x0040;justlikekevin](https://github.com/justlikekevin),
[&#x0040;mrcaseb](https://github.com/mrcaseb),
[&#x0040;SCasanova](https://github.com/SCasanova), and
[&#x0040;tanho63](https://github.com/tanho63)
for their questions, feedback, and contributions to this release. 

---

# nflreadr 1.4.0

This release addresses bugs, improves some utilities, and adds a few new datasets.

## New Datasets

- `load_player_stats(stat_type = "defense")` added to provide defensive player stats
as computed by `nflfastR::calculate_player_stats_def()` (#200) It also comes with 
a data dictionary, courtesy of @mpcen (#192)
- `load_ftn_charting()` adds manual charting data for 2022-onwards, graciously 
provided by [FTN Data](https://www.ftndata.com/). This should automatically be updated when published
by FTN, and the early indication is that it will be within 48 hours after a game 
has finished. 

## Function Improvements

- `nflverse_sitrep()` and friends overhauled: 
   - now returns a list of sitrep attributes rather than only printing to console (for programmatic use)
   - now checks CRAN and r-universe to tell you if your installation is behind cran or devel
   - now handles dependencies for nflverse/ffverse packages that are not on CRAN
- `nflreadr::most_recent_season()` and aliases `get_latest_season`, `get_current_season` 
etc now use March 15th as the changeover for league year. Hopefully this is not
a moving target 🙃
- `nflreadr::clean_homeaway()` now handles columns with suffixes `_home` and `_away`
- `nflreadr::nflverse_game_id()` now accepts old team abbreviations and outputs useful errors. 
- Added `.for_cran()` to limit parallelization in CRAN examples and tests
- `make_nflverse_data_class()` now uses `data.table::setattr()` to preserve data.table pointer

## Dictionary updates
- Clarified description of the `"special"` variable in the play-by-play data dictionary. (#189)

Thank you to   [&#x0040;ak47twq](https://github.com/ak47twq), [&#x0040;alecglen](https://github.com/alecglen), [&#x0040;andycancapital](https://github.com/andycancapital), [&#x0040;bullaspc](https://github.com/bullaspc), [&#x0040;mcarman8](https://github.com/mcarman8), [&#x0040;mpcen](https://github.com/mpcen), [&#x0040;mrcaseb](https://github.com/mrcaseb), [&#x0040;tanho63](https://github.com/tanho63), [&#x0040;tashapiro](https://github.com/tashapiro), and [&#x0040;TheMathNinja](https://github.com/TheMathNinja) 
for their questions, feedback, and contributions to this release

--


# nflreadr 1.3.2

Minor changes per changelist and patch CRAN-related example issue.

## Changes

- `.clear_cache()` now re-exported without dot prefix as `clear_cache()`. Hopefully more obvious.
- `join_coalesce()` is now added as a utility to join two dataframes and coalesce any shared columns.
- `load_teams()` now uses the argument `current` (TRUE/FALSE) to standardize which rows are returned - this aligns with `nflreadr::clean_team_abbrs` and `nflreadr::team_abbr_mapping`
- `dictionary_participation` added (thank you @josephhero!)
- `clean_homeaway()` now preserves neutral site location as well as input class and input attributes
- `load_ff_rankings()` URL bug corrected (thank you @kharigardner)
- test and example for `clean_homeaway()` resolved for CRAN failure

Thank you to [&#x0040;ak47twq](https://github.com/ak47twq), [&#x0040;bachlaw](https://github.com/bachlaw), [&#x0040;brunomioto](https://github.com/brunomioto), [&#x0040;guga31bb](https://github.com/guga31bb), [&#x0040;Josephhero](https://github.com/Josephhero), [&#x0040;kharigardner](https://github.com/kharigardner), [&#x0040;mrcaseb](https://github.com/mrcaseb), [&#x0040;MysteryPollster](https://github.com/MysteryPollster), [&#x0040;numbersinfigures](https://github.com/numbersinfigures), and [&#x0040;ohri](https://github.com/ohri) for their questions, feedback, and contributions towards this release.

---

# nflreadr 1.3.1

Fixes CRAN bug and provides some function improvements, most notably improved logic for `load_participation()`'s pbp join. 

## New Features

- Added `nflverse_game_id()` which computes valid nflverse game identifiers in the format `"{season}_{week}_{away}_{home}"`

## Function Updates
- `load_participation()` now joins pbp on via `nflverse_game_id` instead of `old_game_id`
- `load_snap_counts()` now allows download of the 2012 season which was previously hardcoded from 2013 (#128)
- `progressively()` now works with purrr-style lambda functions and no longer checks for progressor class, allowing it to be used more flexibly (and with cli-based progress bars.)

## Bugfixes
- `nflverse_releases()` and `nflverse_download()` now accept `.token` arguments which default to `gh::gh_token()`. This is mostly to let us test things properly. (#131)
- Adjust import references per Jenny Bryan's recommendations in hadley/r-pkgs#828 to avoid loading unused packages.
- `clean_player_names()` now fully lives in nflreadr, the squish/trim happens first
- player name mapping update
- `get_current_season()` now exists, because we can't agree on what to name things.

Thank you to [&#x0040;atungate](https://github.com/atungate), &#x0040;grayhawk40, [&#x0040;guga31bb](https://github.com/guga31bb),[&#x0040;jestarr](https://github.com/jestarr), [&#x0040;john-b-edwards](https://github.com/john-b-edwards),[&#x0040;marvin3FF](https://github.com/marvin3FF),[&#x0040;mrcaseb](https://github.com/mrcaseb), [&#x0040;SCasanova](https://github.com/SCasanova), [&#x0040;shirondru](https://github.com/shirondru), [&#x0040;tanho63](https://github.com/tanho63), and [&#x0040;TheMathNinja](https://github.com/TheMathNinja) for their contributions and feedback towards this release!

---

# nflreadr 1.3.0

This release introduces several new data functions, some new utilities, and an array of data/function updates. 

## New Data!

- `load_participation()` returns new play-level information about what players are on the field, how many players are in the box, and what formation the offense is using. Data from NGS starting 2016 and onward  
- `load_contracts()` downloads (historical) player contracts from [OverTheCap.com](https://overthecap.com/contract-history)
- `load_players()` returns player-level information and is the new recommended source (over rosters) for IDs, positions, birthdates etc.
- `load_rosters_weekly()` provides week-by-week team rosters dating back to 2002.
- `load_officials()` returns game-level information about which officials are assigned to specific games.

## New Functions! 

- `nflverse_download()` downloads all files attached to specified/all releases to a local folder. This facilitates something like `arrow::open_dataset()` for reading files locally.
- `nflverse_releases()` lists all releases that can be loaded through `nflverse_download()`
- `load_from_url()` exposes a new utility function for loading any csv, rds, qs, parquet URL to memory. 

## Function Updates!

- `load_draft_picks()` now has the rest of the career stat fields from PFR 
- `*sitrep()` functions now report package-specific options that are set.
- `get_current_week()` helper to get the current nfl season week 
- `load_rosters()` now provides season-level rosters dating back to 1920. 

## Other bugfixes

- moved rbindlist to a helper that manages attributes better
- update `dictionary_snap_counts` and `dictionary_schedules` with some missing fields 
- rewrite from_url error messages to use cli and improve usefulness
- bump minimum rlang version to 1.0.0
- add piggyback suggested dependency
- Export old class to support S4/DBI/`nflfastR::update_db()` as if it were a tibble
- Fix exportOldClass so that it supports only data.frame stuff? we have no idea,,,
- `options(nflreadr.prefer)` defaults to rds now since qs is no longer a required dependency
- `clean_player_names()` now also removes commas (after optionally using them for `convert_lastfirst`) 
- `clean_player_names()` now also removes all caps suffixes
- dictionary updates: return labelled.
- `.sitrep()` exits nicely if no packages are to be investigated. #114 
- refactored all the loaders to use `load_from_url` as primary
- fixed broken example in `load_ff_opportunity()` documentation. #117

Thank you to [&#x0040;albtree](https://github.com/albtree), [&#x0040;john-b-edwards](https://github.com/john-b-edwards), [&#x0040;mrcaseb](https://github.com/mrcaseb), [&#x0040;pranavrajaram](https://github.com/pranavrajaram), [&#x0040;tanho63](https://github.com/tanho63), and [&#x0040;tpenney89](https://github.com/tpenney89) for their contributions and feedback on this release!

---

# nflreadr 1.2.0

This release updates all nflverse URLs to use the new [nflverse-data repository](https://github.com/nflverse/nflverse-data) releases, as well as provides improved pretty-printing methods that tell you when the data was last updated. 

---


# nflreadr 1.1.3

This release adds functions and arguments to access new data, along with some backend changes. 

## New data and functions

- `load_ff_opportunity()` downloads expected fantasy points data from the [ffopportunity package](https://ffopportunity.ffverse.com)
- `load_ff_rankings()` gains an `"all"` parameter to return all available rankings data (weekly archives since 2019)
- `load_pfr_advstats()` gains a `"summary_level"` parameter to return season-level data, which has some fields that are not available at the week-level. 

## Backend

- `options(nflreadr.verbose)` replaces `options(nflreadr.cache_warning)` as the best way to silence nflreadr messages.
- Improved data dictionaries for ESPN QBR, Injuries, Trades, Depth Charts, and Combine
- Exported `most_recent_season()` function
- Updated documentation with improved linking and where to file data issues.
- Sitrep functions have ffopportunity and nflverse packages.
- Pkgdown site upgraded to Bootstrap 5.

Thank you to [&#x0040;armstjc](https://github.com/armstjc), [&#x0040;Grayhawk34](https://github.com/Grayhawk34), [&#x0040;john-b-edwards](https://github.com/john-b-edwards), [&#x0040;mrcaseb](https://github.com/mrcaseb), [&#x0040;pranavrajaram](https://github.com/pranavrajaram), [&#x0040;rogers1000](https://github.com/rogers1000), and [&#x0040;tanho63](https://github.com/tanho63) for their contributions and feedback on this release!

---

# nflreadr 1.1.2

## New Functions

- `nflverse_sitrep()` and `ffverse_sitrep()` give a minimal overview of the package dependencies
- Minimum R version bumped to R 3.6.0 - this is the minimum version required to read the [current RDS file-version](https://stat.ethz.ch/R-manual/R-devel/library/base/html/readRDS.html). 
- `_sitrep()` functions receive a small print-related bugfix and colouring improvement.

---

# nflreadr 1.1.1

## New Data and Functions
- `clean_player_names()` and `clean_team_abbrs()` added - these help standardise player names and team abbreviations based on internal dictionaries. 
- `load_ff_rankings()` now has a `type` argument and can return `"draft"` or `"week"` rankings from the DynastyProcess/data repo.
- `clean_homeaway()` converts a dataframe of games with columns prefixed with `home_` and `away_` to a dataframe of teams, renaming to `team_` and `opponent_` and doubling the rows.
- Added `load_pfr_advstats()` which provides pass, rush, rec, def additional data for each week.

## Bug Fixes

- Add Rcpp and RcppParallel minimum dependencies to fix qs issues.
- Added a message that reminds the user of the caching behavior. The message will be displayed once every 8 hours if the session is interactive.
- Adjusted file location of snap count data 

Thank you to [&#x0040;ajreinhard](https://github.com/ajreinhard), [&#x0040;brunomioto](https://github.com/brunomioto), [&#x0040;jthomasmock](https://github.com/jthomasmock), [&#x0040;mrcaseb](https://github.com/mrcaseb), [&#x0040;SCasanova](https://github.com/SCasanova), and [&#x0040;tanho63](https://github.com/tanho63) for their feedback and contributions to this package!

---

# nflreadr 1.1.0

This release makes some backend changes for speed, reduced dependency footprint, and ease of maintenance. 

## New Data

- `load_player_stats()` can now retrieve weekly summaries of kicking data by specifying the `stat_type` argument to be `"kicking"`.
- `load_combine()` retrieves NFL combine data (from PFR).

## Backend Changes

- Remove progress handling from `*_from_url()` family of functions and move responsibility to `progressively()` function decorator instead. See vignette for details.
- Removed dependency on `dplyr` and `purrr` in favour of `data.table` - this hopefully improves speed and reduces the dependency footprint.
- Uses `rlang::arg_match0` instead of match.arg (uses rlang explicitly instead of implicitly as a dependency of memoise).

---

# nflreadr 1.0.0

The goal of {`nflreadr`} is to efficiently load data from [nflverse GitHub repositories](https://github.com/nflverse), and features caching, optional progress updates, and data dictionaries.

At this time, it includes data from the following repositories:

- [nflverse/nflverse-pbp](https://github.com/nflverse/nflverse-pbp)
- [nflverse/nfldata](https://github.com/nflverse/nfldata)
- [nflverse/nflverse-rosters](https://github.com/nflverse/nflverse-rosters)
- [nflverse/espnscrapeR-data](https://github.com/nflverse/espnscrapeR-data)
- [nflverse/nflverse-pfr](https://github.com/nflverse/nflverse-pfr)
- [dynastyprocess/data](https://github.com/dynastyprocess/data)

This will hopefully provide a unified and reliable package for downloading nflverse data that can be extended to the rest of the nflverse and ffverse package families.

Special thanks to Seb, Ben, John, Lee, and Thomas for their contributions to the package and to the data pipelines that this package relies on 🎉
