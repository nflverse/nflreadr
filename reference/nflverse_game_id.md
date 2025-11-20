# Compute nflverse Game Identifiers

Compute nflverse Game Identifiers

## Usage

``` r
nflverse_game_id(season, week, away, home)
```

## Arguments

- season:

  4 digit season between 1999 and the output of
  [`most_recent_season()`](https://nflreadr.nflverse.com/reference/latest_season.md)

- week:

  Numeric or character giving the week, between 1 and 22.

- home, away:

  Valid NFL team abbreviation as it can be found in
  [team_abbr_mapping](https://nflreadr.nflverse.com/reference/team_abbr_mapping.md)

## Value

A character vector

## Examples

``` r
nflverse_game_id(2022, 2, "LAC", "KC")
#> [1] "2022_02_LAC_KC"
```
