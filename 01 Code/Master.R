setwd("~/Tech/afl/01 Code")
source("libraries.R")
curLadder <- data.table(fitzRoy::fetch_ladder_afl(2023))

fitzRoy::fetch_betting_odds_footywire(2020)

?fetch_betting_odds_footywire

names(fitzRoy::fetch_fixture(2023))

fixture <- data.table(fitzRoy::fetch_fixture(2023))
fixture %>% head
