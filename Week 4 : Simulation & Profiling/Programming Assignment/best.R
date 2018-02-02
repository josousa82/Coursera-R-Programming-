require(dplyr)
require(rlang)

best <- function(state, outcome2 = c("heart failure", "heart attack", "pneumonia")){
    
  ##lev <- c("heart failure", "heart attack", "pneumonia")
   outcome2 <- tryCatch(match.arg(outcome2), 
                        error = function(e) {
                          print(paste0("Error in best(", state, ", ", outcome2,") : invalid outcome"))
                          stop(e)
                          } 
                        ) 
    
    switch (outcome2,
      "heart failure" = outcome2 <- c(".Mortality.H.Failure"),
      "heart attack" = outcome2 <- c(".Mortality.H.Attack"),
      "pneumonia" = outcome2 <- c(".Mortality.Pneumonia")
    )
   
    out.sym <- sym(outcome2)

    final.df <- cleanOutcome %>%
                select(.Hospital, .St, outcome2)%>%
                na.omit(outcome2)%>%
                arrange(-desc(UQ(out.sym)))
    
    head(final.df[1, ])
    
}


