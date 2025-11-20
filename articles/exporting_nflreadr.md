# Using nflreadr in packages

## Re-exporting nflreadr functions

You can re-export `nflreadr` functions in your package by using the
following roxygen template:

``` r
#' @inherit nflreadr::load_nextgen_stats
#' @export
# Need to add own examples if the function name is different
#' @examples
#' load_ng_stats(2020)
load_ng_stats <- nflreadr::load_nextgen_stats
```

## Using progressr with from_url functions

The `from_url` family of functions can be adapted with the
[`progressively()`](https://nflreadr.nflverse.com/reference/progressively.md)
function decorator to signal progress. Here’s an example, adapted from
the
[`load_rosters()`](https://nflreadr.nflverse.com/reference/load_rosters.md)
source code:

``` r
load_rosters <- function(seasons = 1999:2020){

  # Create a progressor function inside your function that knows how many "steps" there will be
  p <- progressr::progressor(steps = length(seasons)) 

  # Form the URLs to pass into rds_from_url
  urls <- paste0(
    "https://github.com/nflverse/nflverse-rosters/",
    "raw/master/data/seasons/roster_",
    seasons, 
    ".rds")

  # Use `progressively()` to wrap the existing function rds_from_url and 
  # call the `p()` progressor function as a signal immediately after each iteration
  
  out <- purrr::map_dfr(urls, progressively(rds_from_url,p))
  
  return(out)
}
```

This will cause p() to execute once for each rds_from_url call,
effectively “signalling” progress.

In order to receive progress updates, the user must wrap the function
(load_rosters, in this case) with
[`progressr::with_progress()`](https://progressr.futureverse.org/reference/with_progress.html)
as shown here:

``` r
progressr::with_progress(load_rosters(2010:2020))
```

For more information, please see the
[progressr](https://progressr.futureverse.org) documentation.
