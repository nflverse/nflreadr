# Load Expected Fantasy Points

This function downloads precomputed expected points data from
[ffopportunity](https://ffopportunity.ffverse.com) automated releases.

## Usage

``` r
load_ff_opportunity(
  seasons = most_recent_season(),
  stat_type = c("weekly", "pbp_pass", "pbp_rush"),
  model_version = c("latest", "v1.0.0")
)
```

## Arguments

- seasons:

  a numeric vector of seasons to return, defaults to most recent season.
  If set to `TRUE`, returns all available data.

- stat_type:

  one of `"weekly"`, `"pbp_pass"`, `"pbp_rush"`

- model_version:

  one of `"latest"` or `"v1.0.0"`

## Value

Precomputed expected fantasy points data from the ffopportunity
automated releases.

## See also

<https://ffopportunity.ffverse.com> for more on the package, data, and
modelling

<https://nflreadr.nflverse.com/articles/dictionary_ff_opportunity.html>
for the web data dictionary

[`dictionary_ff_opportunity`](https://nflreadr.nflverse.com/reference/dictionary_ff_opportunity.md)
for the data dictionary bundled as a package data frame

Issues with this data should be filed here:
<https://github.com/ffverse/ffopportunity>

## Examples

``` r
# \donttest{
  try({ # prevents cran errors
  load_ff_opportunity()
  load_ff_opportunity(seasons = 2021, stat_type = "pbp_pass", model_version = "v1.0.0")
  })
#> ── nflverse ffopportunity expected points: pbp_pass ────────────────────────────
#> ℹ Data updated: 2022-09-27 11:35:02 UTC
#> # A tibble: 19,769 × 57
#>    game_id       play_id desc  passer_player_id passer_full_name passer_position
#>    <chr>           <dbl> <chr> <chr>            <chr>            <chr>          
#>  1 2021_01_ARI_…      76 (14:… 00-0029701       Ryan Tannehill   QB             
#>  2 2021_01_ARI_…     100 (13:… 00-0029701       Ryan Tannehill   QB             
#>  3 2021_01_ARI_…     152 (13:… 00-0035228       Kyler Murray     QB             
#>  4 2021_01_ARI_…     218 (12:… 00-0035228       Kyler Murray     QB             
#>  5 2021_01_ARI_…     253 (11:… 00-0035228       Kyler Murray     QB             
#>  6 2021_01_ARI_…     386 (10:… 00-0035228       Kyler Murray     QB             
#>  7 2021_01_ARI_…     410 (9:2… 00-0035228       Kyler Murray     QB             
#>  8 2021_01_ARI_…     599 (8:3… 00-0035228       Kyler Murray     QB             
#>  9 2021_01_ARI_…     621 (8:2… 00-0035228       Kyler Murray     QB             
#> 10 2021_01_ARI_…     660 (8:1… 00-0035228       Kyler Murray     QB             
#> # ℹ 19,759 more rows
#> # ℹ 51 more variables: receiver_player_id <chr>, receiver_full_name <chr>,
#> #   receiver_position <chr>, posteam <chr>, two_point_attempt <dbl>,
#> #   two_point_converted <dbl>, pass_attempt <dbl>, receiving_yards <dbl>,
#> #   first_down_pass <dbl>, fumble_lost <dbl>, season <int>, week <int>,
#> #   complete_pass <fct>, yards_after_catch <dbl>, pass_touchdown <fct>,
#> #   first_down <fct>, interception <fct>, relative_to_endzone <dbl>, …
# }
```
