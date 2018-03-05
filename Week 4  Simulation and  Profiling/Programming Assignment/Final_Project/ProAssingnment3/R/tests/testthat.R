library(testthat)
source.scripts <- c("readDataset.R","data.clean.R", "cachedf.R", "best.R", "rankhospital.R" )
lapply(source.scripts, source)
test_results <- test_dir("tests/testthat")