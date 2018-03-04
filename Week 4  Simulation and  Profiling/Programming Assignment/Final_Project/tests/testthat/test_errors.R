context("Test errors on arguments")

test_that("Argument in best function returns error for unmached args", {
    
    throws_error(best("BB", "heart attack"))
    throws_error(best("NY", "hert attack"))
    expect_error(best("NY", "hert attack"), NA)
    expr_text(best("NY", "he attack"), "Error in best(\"NY\", \"he attack\") : invalid outcome")
    
    expect_that(best("BB", "heart attack"), prints_text("Error in best(BB, heart attack) : invalid state"))
    
    
})