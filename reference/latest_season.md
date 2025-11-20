# Get Latest Season

A helper function to choose the most recent season available for a given
dataset

## Usage

``` r
most_recent_season(roster = FALSE)

get_latest_season(roster = FALSE)

get_current_season(roster = FALSE)
```

## Arguments

- roster:

  Either `TRUE` or `FALSE`. If `TRUE`, will return current year after
  March 15th, otherwise previous year. If `FALSE`, will return current
  year on or after Thursday following Labor Day, i.e. Thursday after the
  first Monday in September. Otherwise previous year.

## Value

most recent season (a four digit numeric)

## See also

Other Date utils:
[`get_current_week()`](https://nflreadr.nflverse.com/reference/get_current_week.md)
