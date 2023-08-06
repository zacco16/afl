rm(list = ls()) ; gc()
setwd("~/Tech/afl/01 Code")
source("functions.R")
load_libraries()
fitzRoy

fetch_fixture(season = 2014, comp = "AFLM") ## AFL starts 2014
# fetch_lineup(season = 2023, round_number = 21, comp = "AFLM") ## 2014

results <- data.table(fetch_results(season = 2023, comp = "AFLM"))
results %>% names
results[, .N, match.status]
results[, .N, match.round]

# results_meta <- c()
# data.table(fetch_ladder(season = 2023, round_number = 21, source = "AFL"))
# fetch_ladder(season = 2014) ## 2014
# fetch_player_stats(season = 2014, source = "AFL") %>% names()
# 
# curLadder <- data.table(fitzRoy::fetch_ladder_afl(2023))
# fitzRoy::fetch_betting_odds_footywire(2014)
years <- c(2014 : 2023)
results_appended <- 
  do.call(rbind, lapply(years, function(yr) {
    fetch_results(season = yr, comp = "AFLM")
  })
) %>% as.data.table

results_appended[,.N]
