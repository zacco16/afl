library(devtools)
library(data.table)
library(fitzRoy)

curLadder <- data.table(fitzRoy::fetch_ladder_afl(2023))
