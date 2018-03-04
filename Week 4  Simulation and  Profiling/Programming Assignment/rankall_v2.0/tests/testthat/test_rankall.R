## testthat or assertthat tests for the functions

context("Test result of best.R funtion.")

test_that("best function returns the best hospital by disease, in the last 30 days",{
    
expect_that(rankhospital("TX", "heart failure", 4), equals("DETAR HOSPITAL NAVARRO"))
expect_that(rankhospital("MD", "heart attack", "worst"), equals("HARFORD MEMORIAL HOSPITAL"))
# expect_that(rankhospital("MN", "heart attack", 5000), equals(NA))
#             


})

