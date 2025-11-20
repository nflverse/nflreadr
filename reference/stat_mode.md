# Statistical Mode

Computes the statistical mode, i.e. the value that appears most often in
a vector. Returns the first match, if TRUE for multiple values.

## Usage

``` r
stat_mode(x, ..., na.rm = FALSE)
```

## Arguments

- x:

  A vector of data values.

- ...:

  Further arguments, currently unused.

- na.rm:

  a logical evaluating to `TRUE` or `FALSE` indicating whether `NA`
  values should be stripped before the computation proceeds.

## Value

The statistical mode with the same type as the input vector x.

## Examples

``` r
vector_numeric <- sample(1:5, 15, TRUE)
vector_numeric
#>  [1] 1 2 1 4 1 4 1 2 2 4 2 4 5 3 4
stat_mode(vector_numeric)
#> [1] 4

vector_character <- sample(LETTERS[1:5], 15, TRUE)
vector_character
#>  [1] "A" "E" "A" "E" "A" "A" "E" "B" "E" "C" "A" "D" "B" "A" "C"
stat_mode(vector_character)
#> [1] "A"
```
