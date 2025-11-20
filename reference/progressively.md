# Progressively

This function helps add progress-reporting to any function - given
function `f()` and progressor `p()`, it will return a new function that
calls `f()` and then (on exiting) will call `p()` after every iteration.
This is inspired by purrr's `safely`, `quietly`, and `possibly` function
decorators.

## Usage

``` r
progressively(f, p = NULL)
```

## Arguments

- f:

  a function to add progressor functionality to.

- p:

  a function such as one created by
  [`progressr::progressor()`](https://progressr.futureverse.org/reference/progressor.html) -
  also accepts purrr-style lambda functions.

## Value

a function that does the same as `f` but it calls `p()` after iteration.

## See also

<https://nflreadr.nflverse.com/articles/exporting_nflreadr.html> for
vignette on exporting nflreadr in packages

## Examples

``` r
# \donttest{
try({ # prevents cran errors

urls <- rep("https://github.com/nflverse/nflverse-data/releases/download/test/combines.csv",3)

lapply(urls, progressively(read.csv, ~cli::cli_progress_step('Loading...')))

read_rosters <- function(urls){
  p <- progressr::progressor(along = urls)
  lapply(urls, progressively(read.csv, p))
}

progressr::with_progress(read_rosters())

})
#> ℹ Loading...
#> ✔ Loading... [7ms]
#> 
#> ℹ Loading...
#> ✔ Loading... [6ms]
#> 
#> ℹ Loading...
#> ✔ Loading... [6ms]
#> 
#> Error in read_rosters() : argument "urls" is missing, with no default
# }
```
