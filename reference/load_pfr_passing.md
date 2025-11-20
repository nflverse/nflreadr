# Load Advanced Passing Stats from PFR

Loads player level season stats provided by Pro Football Reference
starting with the 2019 season.

## Usage

``` r
load_pfr_passing(seasons = TRUE)
```

## Arguments

- seasons:

  a numeric vector specifying what seasons to return, if `TRUE` returns
  all available data

## Value

A tibble of season-level player statistics provided by Pro Football
Reference.

## See also

<https://nflreadr.nflverse.com/articles/dictionary_pfr_passing.html> for
the web data dictionary

[`dictionary_pfr_passing`](https://nflreadr.nflverse.com/reference/dictionary_pfr_passing.md)
for the data dictionary as bundled within the package

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-pfr>

## Examples

``` r
# \donttest{
  load_pfr_passing()
#> Warning: `load_pfr_passing()` has been deprecated, please use
#> `load_pfr_advstats(stat_type = 'pass', summary_level = 'season')`
#> ── nflverse advanced passing season stats via PFR ──────────────────────────────
#> ℹ Data updated: 2025-11-20 12:43:48 UTC
#> # A tibble: 830 × 37
#>    player        team  pass_attempts throwaways spikes drops drop_pct bad_throws
#>    <chr>         <chr>         <dbl>      <dbl>  <dbl> <dbl>    <dbl>      <dbl>
#>  1 Ben Roethlis… PIT             675          7      3    24      3.6        122
#>  2 Patrick Maho… KC              580         24      1    28      5           95
#>  3 Matt Ryan     ATL             608         18      1    36      6.1         79
#>  4 Jared Goff    LAR             561         29      2    13      2.5         93
#>  5 Andrew Luck   IND             639          8      2    37      5.9         88
#>  6 Aaron Rodgers GB              597         48      2    27      4.9        106
#>  7 Tom Brady     NE              570         22      2    25      4.6        103
#>  8 Philip Rivers LAC             508         13      0    23      4.6         64
#>  9 Eli Manning   NYG             576          9      1    24      4.2         94
#> 10 Kirk Cousins  MIN             606         17      3    25      4.3         68
#> # ℹ 820 more rows
#> # ℹ 29 more variables: bad_throw_pct <dbl>, season <int>, pfr_id <chr>,
#> #   pocket_time <dbl>, times_blitzed <dbl>, times_hurried <dbl>,
#> #   times_hit <dbl>, times_pressured <dbl>, pressure_pct <dbl>,
#> #   batted_balls <dbl>, on_tgt_throws <dbl>, on_tgt_pct <dbl>, rpo_plays <dbl>,
#> #   rpo_yards <dbl>, rpo_pass_att <dbl>, rpo_pass_yards <dbl>,
#> #   rpo_rush_att <dbl>, rpo_rush_yards <dbl>, pa_pass_att <dbl>, …
# }
```
