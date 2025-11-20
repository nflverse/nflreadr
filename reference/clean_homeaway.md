# Clean Home/Away in dataframes into Team/Opponent dataframes

This function converts dataframes with "home\_" and "away\_" prefixed
columns to "team\_" and "opponent\_", and doubles the rows. This makes
sure that there's one row for each team (as opposed to one row for each
game).

## Usage

``` r
clean_homeaway(dataframe, invert = NULL)
```

## Arguments

- dataframe:

  dataframe

- invert:

  a character vector of columns that gets inverted when referring to the
  away team (e.g. home spread = 1 gets converted to away_spread = -1)

## Value

a dataframe with one row per team (twice as long as the input dataframe)

## Examples

``` r
# a small example dataframe
s <- data.frame(
   game_id = c("2020_20_TB_GB", "2020_20_BUF_KC", "2020_21_KC_TB"),
   game_type = c("CON", "CON", "SB"),
   away_team = c("TB", "BUF", "KC"),
   away_score = c(31L, 24L, 9L),
   home_team = c("GB", "KC", "TB"),
   home_score = c(26L, 38L, 31L),
   location = c("Home", "Home", "Neutral"),
   result = c(-5L, 14L, 22L),
   spread_line = c(3, 3, -3)
 )

clean_homeaway(s, invert = c("result","spread_line"))
#>          game_id game_type opponent opponent_score team team_score location
#> 1  2020_20_TB_GB       CON       TB             31   GB         26     home
#> 2  2020_20_TB_GB       CON       GB             26   TB         31     away
#> 3 2020_20_BUF_KC       CON      BUF             24   KC         38     home
#> 4 2020_20_BUF_KC       CON       KC             38  BUF         24     away
#> 5  2020_21_KC_TB        SB       KC              9   TB         31  neutral
#> 6  2020_21_KC_TB        SB       TB             31   KC          9  neutral
#>   result spread_line
#> 1     -5           3
#> 2      5          -3
#> 3     14           3
#> 4    -14          -3
#> 5     22          -3
#> 6    -22           3
```
