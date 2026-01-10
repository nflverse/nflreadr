# Load Game/Schedule Data

This returns game/schedule information as maintained by Lee Sharpe.

## Usage

``` r
load_schedules(seasons = TRUE)
```

## Arguments

- seasons:

  a numeric vector of seasons to return, default `TRUE` returns all
  available data.

## Value

A tibble of game information for past and/or future games.

## See also

<https://nflreadr.nflverse.com/articles/dictionary_schedules.html> for a
web version of the data dictionary

[`dictionary_schedules`](https://nflreadr.nflverse.com/reference/dictionary_schedules.md)
for the data dictionary as a dataframe

Issues with this data should be filed here:
<https://github.com/nflverse/nfldata>

## Examples

``` r
# \donttest{
try({ # prevents cran errors
 load_schedules(2020)
})
#> ── nflverse games and schedules ────────────────────────────────────────────────
#> ℹ Data updated: 2026-01-10 14:34:43 UTC
#> # A tibble: 269 × 46
#>    game_id  season game_type  week gameday weekday gametime away_team away_score
#>    <chr>     <int> <chr>     <int> <chr>   <chr>   <chr>    <chr>          <int>
#>  1 2020_01…   2020 REG           1 2020-0… Thursd… 20:20    HOU               20
#>  2 2020_01…   2020 REG           1 2020-0… Sunday  13:00    SEA               38
#>  3 2020_01…   2020 REG           1 2020-0… Sunday  13:00    CLE                6
#>  4 2020_01…   2020 REG           1 2020-0… Sunday  13:00    NYJ               17
#>  5 2020_01…   2020 REG           1 2020-0… Sunday  13:00    LV                34
#>  6 2020_01…   2020 REG           1 2020-0… Sunday  13:00    CHI               27
#>  7 2020_01…   2020 REG           1 2020-0… Sunday  13:00    IND               20
#>  8 2020_01…   2020 REG           1 2020-0… Sunday  13:00    GB                43
#>  9 2020_01…   2020 REG           1 2020-0… Sunday  13:00    MIA               11
#> 10 2020_01…   2020 REG           1 2020-0… Sunday  13:00    PHI               17
#> # ℹ 259 more rows
#> # ℹ 37 more variables: home_team <chr>, home_score <int>, location <chr>,
#> #   result <int>, total <int>, overtime <int>, old_game_id <chr>, gsis <int>,
#> #   nfl_detail_id <chr>, pfr <chr>, pff <int>, espn <chr>, ftn <int>,
#> #   away_rest <int>, home_rest <int>, away_moneyline <int>,
#> #   home_moneyline <int>, spread_line <dbl>, away_spread_odds <int>,
#> #   home_spread_odds <int>, total_line <dbl>, under_odds <int>, …
# }
```
