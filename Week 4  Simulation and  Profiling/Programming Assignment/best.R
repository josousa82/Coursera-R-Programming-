require(dplyr)
require(rlang)
source("data.clean.R")

best <- function(state, outcome2 = c("heart failure", "heart attack", "pneumonia")){
    
  ##lev <- c("heart failure", "heart attack", "pneumonia")
    df.cl <- clean.best("Data", "outcome-of-care-measures.csv")
    
    tryCatch(
        {
        outcome2 <- match.arg(outcome2)
        },     
        
         error = function(e) {
             print(e)
           cat(sprintf("Error in best(\"%s\", \"%s\") : invalid outcome\n", state, outcome2))
         }
    )    
    
    switch (outcome2,
      "heart failure" = outcome2 <- c(".Mortality.H.Failure"),
      "heart attack" = outcome2 <- c(".Mortality.H.Attack"),
      "pneumonia" = outcome2 <- c(".Mortality.Pneumonia")
    )
   
    f.df <- df.cl %>%
                arrange(-desc(rate))
    
   result <- f.df[f.df$.St == state & f.df$condition == outcome2, ]
   
   result[1,1]    
}