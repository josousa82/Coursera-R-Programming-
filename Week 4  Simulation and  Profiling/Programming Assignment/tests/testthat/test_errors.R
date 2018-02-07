context("Test errors on arguments")

test_that("Argument in best function returns error for unmached args", {
    expect_error(best("BB", "heart attack"), "Error in best(\"heart attack\", \"BB\") : invalid outcome\n")
    
   
    
  expect_that(best("BB", "heart attack"), equals(c("Error in best(\"BB\", \"heart attack\") : invalid state")))
  expect_that(best("NY", "hert attack"), equals(c("Error in best(\"NY\", \"hert attack\") : invalid outcome")))
    
})