require(dplyr)
require(rlang)

best <- function(state, outcome2 = c("heart failure", "heart attack", "pneumonia")){
    
  ##lev <- c("heart failure", "heart attack", "pneumonia")
   outcome2 <- tryCatch(match.arg(outcome2), 
                        error = function(e) {
                          print(paste0("Error in best(", state, ", ", outcome2,") : invalid outcome\n"))
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
                na.omit()%>%
                select(.Hospital, .St, outcome2)%>%
                arrange(-desc(UQ(out.sym)))
    
    head(final.df[1, ".Hospital"])
    
}


