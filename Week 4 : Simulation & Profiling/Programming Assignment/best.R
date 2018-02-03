require(dplyr)
require(rlang)
source("data.clean.R")

best <- function(state, outcome2 = c("heart failure", "heart attack", "pneumonia")){
    
  ##lev <- c("heart failure", "heart attack", "pneumonia")
    df.clean <- clean.best("Data", "outcome-of-care-measures.csv")
    
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
   
    out.sym <- sym(outcome2)

    final.df <- df.clean %>%
                arrange(-desc(UQ(out.sym)))
    
    df.clean[df.clean$.St == "TX" & condition == ".Mortality.H.Attack",  ]%>%
    arrange(-desc(rate))%>%
    
    final.df[1, outcome2]
    
    ##test.gat.df.g[test.gat.df.g$.St =="MN",]
    
}


