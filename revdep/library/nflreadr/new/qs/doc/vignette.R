## ----eval=FALSE---------------------------------------------------------------
#  library(qs)
#  df1 <- data.frame(x=rnorm(5e6), y=sample(5e6), z=sample(letters,5e6, replace=T))
#  qsave(df1, "myfile.qs")
#  df2 <- qread("myfile.qs")

## ----eval=FALSE---------------------------------------------------------------
#  # CRAN version
#  install.packages("qs")
#  
#  # CRAN version compile from source (recommended)
#  remotes::install_cran("qs", type="source", configure.args="--with-simd=AVX2")
#  
#  # For earlier versions of R <= 3.4
#  remotes::install_github("traversc/qs@legacy")

## ----eval=FALSE---------------------------------------------------------------
#  data.frame(a=rnorm(5e6),
#             b=rpois(5e6,100),
#             c=sample(starnames$IAU,5e6,T),
#             d=sample(state.name,5e6,T),
#             stringsAsFactors = F)

## ----eval=FALSE---------------------------------------------------------------
#  # With byte shuffling
#  x <- 1:1e8
#  qsave(x, "mydat.qs", preset="custom", shuffle_control=15, algorithm="zstd")
#  cat( "Compression Ratio: ", as.numeric(object.size(x)) / file.info("mydat.qs")$size, "\n" )
#  # Compression Ratio:  1389.164
#  
#  # Without byte shuffling
#  x <- 1:1e8
#  qsave(x, "mydat.qs", preset="custom", shuffle_control=0, algorithm="zstd")
#  cat( "Compression Ratio: ", as.numeric(object.size(x)) / file.info("mydat.qs")$size, "\n" )
#  # Compression Ratio:  1.479294

## ----eval=FALSE---------------------------------------------------------------
#  library(qs)
#  x <- qserialize(c(1,2,3))
#  qdeserialize(x)
#  [1] 1 2 3

## ----eval=FALSE---------------------------------------------------------------
#  library(qs)
#  library(Rcpp)
#  sourceCpp("test.cpp")
#  # save file using Rcpp interface
#  test()
#  # read in file create through Rcpp interface
#  qread("/tmp/myfile.qs")
#  [1] 1 2 3

