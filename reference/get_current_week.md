# Get Current Week

A helper function that returns the upcoming NFL regular season week
based on either the nflverse schedules file (as found in
[`load_schedules()`](https://nflreadr.nflverse.com/reference/load_schedules.md))
or some date-based heuristics (number of weeks since the first Monday of
September)

## Usage

``` r
get_current_week(use_date = FALSE, ...)
```

## Arguments

- use_date:

  a logical to determine whether to use date-based heuristics to
  determine current week, default FALSE (i.e. uses schedule file)

- ...:

  Arguments passed on to
  [`most_recent_season()`](https://nflreadr.nflverse.com/reference/latest_season.md)

## Value

current nfl regular season week as a numeric

## Details

Note that the date heuristic will count a new week starting on
Thursdays, while the schedule-based method will count a new week after
the last game of the previous week, e.g. after MNF is completed. Tan and
Ben argued for a while about this.

## See also

Other Date utils:
[`most_recent_season()`](https://nflreadr.nflverse.com/reference/latest_season.md)

## Examples

``` r
{
  # \donttest{
    try({ # schedules file as per default requires online access
    get_current_week()
    })
  # }
  # using the date method works offline
  get_current_week(use_date = TRUE)
}
#> [1] 20
```
