# nflreadr 1.1.1

## New Data
- `clean_player_names()` and `clean_team_abbrs()` added - these help standardise player names and team abbreviations based on internal dictionaries. (v1.1.0.01)
- `load_ff_rankings()` now has a `type` argument and can return `"draft"` or `"week"` rankings from the DP/data repo. (v1.1.0.02)
- `clean_team_abbrs()` now accepts the conference abbreviations `"AFC"` and `"NFC"`. (v1.1.0.03)
- `clean_homeaway()` converts a dataframe of games with columns prefixed with `home_` and `away_` to a dataframe of teams, renaming to `team_` and `opponent_` and doubling the rows. (v1.1.0.06)
- Add Rcpp 1.0.7 dependency to fix qs issues.
- Added a message that reminds the user of the caching behavior. The message will be displayed once every 8 hours. (v1.1.0.07)
- Added `load_pfr_advstats()` which provides pass, rush, rec, def additional data for each week. (v1.1.0.08)
- Adjusted file location of snap count data (v1.1.0.08)
- Adjusted caching reminder to check if interactive. (v1.1.0.08)
- Add RcppParallel 5.1.4 dependency to further fix qs issues. (v1.1.0.08)

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
