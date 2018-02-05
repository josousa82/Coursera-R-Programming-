context("Test errors on arguments")

test_that("Argument in best function returns error for unmached args", {
    
    expect_error(best("BB", "heart attack"), "Error in best(\"BB\", \"heart attack\") : invalid state")
    expect_error(best("NY", "hert attack"), "Error in best(\"NY\", \"hert attack\") : invalid outcome")
    
})