require(dplyr)
require(rlang)
source("data.clean.R")

best <- function(state, outcome){
    
    lev <- c("heart failure", "heart attack", "pneumonia")
    
    tryCatch(
        {
            outcome <- match.arg(outcome, lev, several.ok = TRUE)
        },     
        
        error = function(e) {
            cat(sprintf("Error in best(\"%s\", \"%s\") : invalid outcome\n", state, outcome))
        }
        
        
    ) 
    
    ## change name var outcome to desired string 
    
    switch (outcome,
            "heart failure" = outcome <- c(".Mortality.H.Failure"),
            "heart attack" = outcome <- c(".Mortality.H.Attack"),
            "pneumonia" = outcome <- c(".Mortality.Pneumonia")
    )
    
    ## read csv file
    
    filePath <- file.path("Data", "outcome-of-care-measures.csv")
    df.final <- read.csv(filePath, colClasses = "character")
    
    ## clean outcome data frame, for best function
        ## START CLEAN
    colnames.df <- c(".Hospital", ".St", ".Mortality.H.Attack", 
                     ".Mortality.H.Failure", ".Mortality.Pneumonia")
    
    names.hosp.30day.state <- c("Hospital.Name", "State", 
                                "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                                "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
                                "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    )
    
    ## attach dataset to R search path
   ## attach(df.final)
   
    ## select col for final df for function best
    
    df.final <- df.final %>% select(names.hosp.30day.state)
    
    
    ## rename col names in final data frame
    
    colnames(df.final) <- c(".Hospital", ".St", ".Mortality.H.Attack", 
                            ".Mortality.H.Failure", ".Mortality.Pneumonia")
    
    suppressWarnings(df.final <- df.final%>% 
                         transform(.Mortality.H.Attack = as.numeric(.Mortality.H.Attack),
                                   .Mortality.H.Failure = as.numeric(.Mortality.H.Failure), 
                                   .Mortality.Pneumonia = as.numeric(.Mortality.Pneumonia), 
                                   .St = as.factor(.St))%>%
                         gather(condition, rate, .Mortality.H.Attack:.Mortality.Pneumonia)%>%
                         arrange(-desc(rate))%>%
                         na.omit())%>%
                         mutate(condition = recode(condition,
                                                   .Mortality.H.Attack = "heart attack",
                                                   .Mortality.H.Failure = "heart failure",
                                                   .Mortality.Pneumonia = "pneumonia"))
    ## FINISH data clean
                         
     ## detach(df.final)
     df.final[df.final$.St == state & df.final$condition == outcome, ][1,1]
    
 
}