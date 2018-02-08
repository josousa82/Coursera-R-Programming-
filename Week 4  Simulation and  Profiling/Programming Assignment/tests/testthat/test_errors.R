context("Test errors on arguments")

test_that("Argument in best function returns error for unmached args", {
    
    throws_error(best("BB", "heart attack"))
    throws_error(best("NY", "hert attack"))
    ##expect_error(best("BB", "heart attack"), "Error in best(\"heart attack\", \"BB\") : invalid outcome\n")
    
   
    
    ## expect_that(best("BB", "heart attack"), prints_text("Error in best(\"BB\", \"heart attack\") : invalid state"))
    ##expect_that(best("NY", "hert attack"), equals(c("Error in best(\"NY\", \"hert attack\") : invalid outcome")))
    
})