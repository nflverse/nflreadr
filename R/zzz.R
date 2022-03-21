# nocov start
.onLoad <- function(libname,pkgname){

  memoise_option <- getOption("nflreadr.cache", default = "memory")

  if(!memoise_option %in% c("memory", "filesystem", "off")) memoise_option <- "memory"

  if(memoise_option == "filesystem"){
    cache_dir <- rappdirs::user_cache_dir(appname = "nflreadr")
    dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
    cache <- cachem::cache_disk(dir = cache_dir)
  }

  if(memoise_option == "memory") cache <- cachem::cache_mem()

  if(memoise_option != "off"){

    assign(x = "rds_from_url",
           value = memoise::memoise(rds_from_url, ~ memoise::timeout(86400), cache = cache),
           envir = parent.env(environment()))
    assign(x = "csv_from_url",
           value = memoise::memoise(csv_from_url, ~ memoise::timeout(86400), cache = cache),
           envir = parent.env(environment()))
    assign(x = "qs_from_url",
           value = memoise::memoise(qs_from_url, ~ memoise::timeout(86400), cache = cache),
           envir = parent.env(environment()))
    assign(x = "raw_from_url",
           value = memoise::memoise(raw_from_url, ~ memoise::timeout(86400), cache = cache),
           envir = parent.env(environment()))
    assign(x = "parquet_from_url",
           value = memoise::memoise(parquet_from_url, ~ memoise::timeout(86400), cache = cache),
           envir = parent.env(environment()))

  }

  if(is.null(getOption("nflreadr.verbose")) && isFALSE(getOption("nflreadr.cache_warning"))) {
    options("nflreadr.verbose" = TRUE)
  }

  if(!is.null(getOption("nflreadr.prefer")) && getOption("nflreadr.prefer") %in% c("qs","parquet")){
    # also check Rcpp/RcppParallel here?
    # auto set to fastest one available if not previously set? e.g. see if arrow is installed, see if qs is installed, then fall back to RDS?
    switch(getOption("nflreadr.prefer"),
           "qs" = rlang::check_installed("qs"),
           "parquet" = rlang::check_installed("arrow"))
  }

}

.onAttach <- function(libname, pkgname){

  # validate nflreadr.prefer

  prefer_type <- getOption("nflreadr.prefer", default = "qs")

  if(!prefer_type %in% c("qs", "parquet", "rds", "csv")) {
    packageStartupMessage("Note: nflreadr.prefer is set to ",
                          prefer_type,
                          'and should be one of c("qs", "parquet", "rds", "csv")')
  }

  # validate nflreadr.cache

  memoise_option <- getOption("nflreadr.cache",default = "memory")

  if (!memoise_option %in% c("memory", "filesystem", "off")) {
    packageStartupMessage('Note: nflreadr.cache is set to "',
                          memoise_option,
                          '" and should be one of c("memory","filesystem", "off"). \n',
                          'Defaulting to "memory".')
    memoise_option <- "memory"
  }
  if(memoise_option == "off") packageStartupMessage('Note: nflreadr.cache is set to "off"')
}

# nocov end
