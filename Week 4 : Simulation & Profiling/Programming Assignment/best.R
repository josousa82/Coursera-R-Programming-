require(dplyr)
require(rlang)
source("data.clean.R")

best <- function(state, outcome2 = c("heart failure", "heart attack", "pneumonia")){
    
  ##lev <- c("heart failure", "heart attack", "pneumonia")
    df.cl <- clean.best("Data", "outcome-of-care-measures.csv")
    
    outcome2 <- tryCatch(match.arg(outcome2), 
                        error = function(e) {
                        
                          print(paste0("Error in best(", state, ", ", outcome2,") : invalid outcome"))
                         ## return(paste0("Error in best(", quo(state), ", ", quo(outcome2),") : invalid outcome"))
                        stop(e)
                          } 
                        ) 
    
    switch (outcome2,
      "heart failure" = outcome2 <- c(".Mortality.H.Failure"),
      "heart attack" = outcome2 <- c(".Mortality.H.Attack"),
      "pneumonia" = outcome2 <- c(".Mortality.Pneumonia")
    )
   
    ##out.sym <- sym(outcome2)
    ##attach(df.clean)
    
    f.df <- df.cl %>%
                arrange(-desc(rate))
    
   ##attach(f.df)   
     ##head(f.df)
   result <- f.df[f.df$.St == state & f.df$condition == outcome2, ]
   attach(result)
   result[1, 1]
     ##detach(f.df)
    ##head(result)
    ##final.df[final.df$.St == state & condition == outcome2, ]
    
   ## final.df[1,]
    
    ##test.gat.df.g[test.gat.df.g$.St =="MN",]
    
}


