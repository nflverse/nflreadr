# nflverse data class

This class has a special S3 print method that tries to read attached
metadata and provide timestamps and source attributes. It otherwise will
dispatch to the `data.frame` class.

## Usage

``` r
as.nflverse_data(df, nflverse_type = NULL, ...)
```
