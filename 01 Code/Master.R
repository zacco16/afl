rm(list = ls()) ; gc()
workingDir <- "~/Tech/afl/"
setwd(workingDir)
codeDir <- "01 Code"
dataDir <- "02 Data"

source(file.path(codeDir, "functions.R"))
load_libraries()

# fetch_fixture(season = 2014, comp = "AFLM") ## AFL starts 2014
# fetch_lineup(season = 2023, round_number = 21, comp = "AFLM") ## 2014

# results <- data.table(fetch_results(season = 2023, comp = "AFLM"))
# results %>% names
# results[, .N, match.status]
# results[, .N, match.round]

# results_meta <- c()
# data.table(fetch_ladder(season = 2023, round_number = 21, comp = "AFLM"))
# fetch_ladder(season = 2014) ## 2014
# fetch_player_stats(season = 2014, source = "AFL") %>% names()
# 
# curLadder <- data.table(fitzRoy::fetch_ladder_afl(2023))
# fitzRoy::fetch_betting_odds_footywire(2014)

years <- c(2014 : 2023)
results_appended <- 
  rbindlist(lapply(years, function(yr) {
    fetch_results_afl(season = yr, comp = "AFLM") %>% as.data.table
  }), fill = TRUE)

list_of_rounds <- results_appended[!round.name %like% "Final", .N, c("round.roundNumber", "round.year")]

ladder_appended <- 
  rbindlist(lapply(1 : list_of_rounds[, .N], function(id) {
    fetch_ladder_afl(season       = list_of_rounds[id, round.year], 
                     round_number = list_of_rounds[id, round.roundNumber],
                     comp = "AFLM") %>% as.data.table
  }), fill = TRUE)

# save.image(file.path(dataDir, "working_data.Rdata"))

# fwrite(data.table(col = ladder_appended %>% names, keep = 0, example = ladder_appended[100]),
#        file.path(dataDir, "ladder_meta.csv"))

ladder_cols <- fread(file.path(dataDir, "ladder_meta.csv"))[abs(keep) == 1, col]
     
ladder_appended[, ..ladder_cols]           