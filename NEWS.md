# nflreadr (development version)

## Changes

- Pkgdown site updated to feature dictionaries and also to upgrade to Bootstrap 5 (v1.1.2.00)
- Added [data dictionary for ESPN QBR](https://nflreadr.nflverse.com/articles/dictionary_espn_qbr.html) (v1.1.2.01)
- Added [data dictionary for Injuries](https://nflreadr.nflverse.com/articles/dictionary_injuries.html) (v1.1.2.02)
- Added [data dictionary for Trades](https://nflreadr.nflverse.com/articles/dictionary_trades.html) (v1.1.2.02)
- Added [data dictionary for Depth Charts](https://nflreadr.nflverse.com/articles/dictionary_depth_charts.html) (v1.1.2.02)
- Added [data dictionary for Combine](https://nflreadr.nflverse.com/articles/dictionary_combine.html) (v1.1.2.02)
- Exported `most_recent_season()` function since it can be useful elsewhere (v1.1.2.03)
- Updated documentation with more/better linking (v1.1.2.04)
- Added [ffopportunity](https://ffopportunity.ffverse.com) and [nflverse](https://nflverse.nflverse.com) packages to sitrep (v1.1.2.04)
- Added `load_ff_opportunity()` function to download expected fantasy points data. (v1.1.2.05)
- Added notes about where to file issues to each data function. (v1.1.2.05)
- Added "all" parameter for `load_ff_rankings()` to return all available data (weekly archives since 2019). (v1.1.2.05)

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

- [nflverse/nflfastR-data](https://github.com/nflverse/nflfastR-data)
- [nflverse/nfldata](https://github.com/nflverse/nfldata)
- [nflverse/nflfastR-roster](https://github.com/nflverse/nflfastR-roster)
- [nflverse/espnscrapeR-data](https://github.com/nflverse/espnscrapeR-data)
- [nflverse/pfr_scrapR](https://github.com/nflverse/pfr_scrapR)
- [dynastyprocess/data](https://github.com/dynastyprocess/data)

This will hopefully provide a unified and reliable package for downloading nflverse data that can be extended to the rest of the nflverse and ffverse package families.

Special thanks to Seb, Ben, John, Lee, and Thomas for their contributions to the package and to the data pipelines that this package relies on 🎉
