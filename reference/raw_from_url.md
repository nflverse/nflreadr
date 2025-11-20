# Load raw filedata from a remote connection

This function allows you to retrieve data from a URL into raw format,
which can then be passed into the appropriate file-reading function.
Data is memoised/cached for 24 hours.

## Usage

``` r
raw_from_url(url)
```

## Arguments

- url:

  a character url

## Value

a raw vector

## Examples

``` r
# \donttest{
try({ # prevents CRAN errors
head(raw_from_url(
  "https://github.com/nflverse/nflverse-data/releases/download/test/combines.rds"
  ),
50)
})
#>  [1] 1f 8b 08 00 00 00 00 00 00 06 ec fd 49 8f 24 49 96 26 08 6a a3 6b a6 b2 02
#> [26] a8 1c ad aa 1c a0 0e 85 82 a1 d1 98 2e 0c ba 1c ee 1e 1e 91 19 3d 3d 13 a6
# }
```
