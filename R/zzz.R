
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

    assign(x = "load_pbp",
           value = memoise::memoise(load_pbp, ~ memoise::timeout(86400), cache = cache),
           envir = parent.env(environment()))

    assign(x = "load_player_stats",
           value = memoise::memoise(load_player_stats, ~ memoise::timeout(86400), cache = cache),
           envir = parent.env(environment()))

    assign(x = "load_team_stats",
           value = memoise::memoise(load_team_stats, ~ memoise::timeout(86400), cache = cache),
           envir = parent.env(environment()))

    assign(x = "load_rosters",
           value = memoise::memoise(load_rosters, ~ memoise::timeout(86400), cache = cache),
           envir = parent.env(environment()))

    assign(x = "load_schedules",
           value = memoise::memoise(load_schedules, ~ memoise::timeout(86400), cache = cache),
           envir = parent.env(environment()))

    assign(x = "load_nextgen_stats",
           value = memoise::memoise(load_nextgen_stats, ~ memoise::timeout(86400), cache = cache),
           envir = parent.env(environment()))

  }
}

.onAttach <- function(libname, pkgname){

  memoise_option <- getOption("nflreadr.cache",default = "memory")

  if (!memoise_option %in% c("memory", "filesystem", "off")) {
    packageStartupMessage(
      'Note: nflreadr.cache is set to "',
      memoise_option,
      '" and should be one of c("memory","filesystem", "off"). \n',
      'Defaulting to "memory".')
    memoise_option <- "memory"
  }

  if(memoise_option == "off") packageStartupMessage('Note: nflreadr.cache is set to "off"')
}
