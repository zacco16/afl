load_libraries <- function(quietly = FALSE) {
  library(devtools)
  library(data.table)
  library(fitzRoy)
  library(magrittr)
  
  if (!quietly) {
    (.packages())
  }
}