## testthat or assertthat tests for the functions

context("Test result of best.R funtion.")

test_that("best function returns the best hospital by disease, in the last 30 days",{
    
expect_equal(best("TX", "heart attack"), "CYPRESS FAIRBANKS MEDICAL CENTER" )
expect_that(best("MD", "heart attack"), equals("JOHNS HOPKINS HOSPITAL, THE"))
expect_that(best("TX", "heart failure"), equals("FORT DUNCAN MEDICAL CENTER"))

})

