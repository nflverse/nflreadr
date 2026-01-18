# Bulk download utilities via piggyback

This function downloads or updates data from the nflverse-data
repository releases, creating subfolders that match the release
structure.

## Usage

``` r
nflverse_download(
  ...,
  folder_path = getOption("nflreadr.download_path", default = "."),
  file_type = getOption("nflreadr.prefer", default = "rds"),
  use_hive = file_type %in% c("parquet", "csv"),
  .token = "default"
)
```

## Arguments

- ...:

  releases to download, provided in either unquoted or character format
  (i.e. pbp or "pbp" are both fine). Available release names can be
  listed with
  [`nflverse_releases()`](https://nflreadr.nflverse.com/reference/nflverse_releases.md)

- folder_path:

  a folder in which subfolders will be created for each release -
  defaults to path specified in `options(nflreadr.download_path)` or "."
  (the current working directory)

- file_type:

  one of `c("rds","parquet", "csv", "qs")` - defaults to file type
  specified in `options(nflreadr.prefer)` or "rds"

- use_hive:

  whether to create hive-style partition folders for each season, e.g.
  `"~/pbp/.season=2021/pbp.csv"`

- .token:

  a GitHub API token, `"default"` uses
  [`gh::gh_token()`](https://gh.r-lib.org/reference/gh_token.html)

## Examples

``` r
# \donttest{
try({
  ## could also set options like
  # options(nflreadr.download_path = tempdir(), nflreadr.prefer = "parquet")

  nflverse_download(combine, contracts, folder_path = tempdir(), file_type = "parquet")

  list.files(tempdir(),pattern = ".parquet$") # check that files were downloaded!
})
#> ℹ Now downloading 2 files to /tmp/RtmpLceS0u.
#> ✔ Downloaded 2 files to /tmp/RtmpLceS0u.
#> character(0)
# }
```
