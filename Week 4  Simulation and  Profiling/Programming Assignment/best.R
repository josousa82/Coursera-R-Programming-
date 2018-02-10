require(dplyr)
require(rlang)
#source("data.clean.R")

best <- function(state, outcome){
    
    cond <- c("heart failure", "heart attack", "pneumonia")
    state.check <- c( "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "GU" ,"HI", 
                      "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", 
                      "MS", "MT","NC", "ND", "NE", "NH", "NJ", "NM","NV", "NY", "OH", "OK", "OR", 
                      "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VA","VI", "VT", "WA", "WI", "WV", "WY")
    
    tryCatch(
        {
          match.arg(outcome, cond, several.ok = TRUE)
        },
        error = function(e) {
           return(message(sprintf("Error in best(\"%s\", \"%s\") : invalid outcome", state, outcome)))
            stop(e)
        },
        finally = function(){
            stop("STOP")
        }
    )
    tryCatch(
        {
            match.arg(state, state.check, several.ok = TRUE)
        },
        error = function(e){
            return(message(sprintf("Error in best(\"%s\",\"%s\") : invalid state", state, outcome)))
        },
        finally = function(){
            stop(e)
        }
    
    )
    ## change name var outcome to desired string

    # switch (outcome,
    #         "heart failure" = outcome <- c(".Mortality.H.Failure"),
    #         "heart attack" = outcome <- c(".Mortality.H.Attack"),
    #         "pneumonia" = outcome <- c(".Mortality.Pneumonia")
    # )
    
    
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
   #attach(df.final)
   
    ## select col for final df for function best
    
    df.final <- df.final %>% select(names.hosp.30day.state)
    
    
    ## rename col names in final data frame
    
    colnames(df.final) <- c(".Hospital", ".St", ".Mortality.H.Attack", 
                            ".Mortality.H.Failure", ".Mortality.Pneumonia")
    
    suppressWarnings(
        df.final <- df.final%>% 
                         transform(.Mortality.H.Attack = as.numeric(.Mortality.H.Attack),
                                   .Mortality.H.Failure = as.numeric(.Mortality.H.Failure), 
                                   .Mortality.Pneumonia = as.numeric(.Mortality.Pneumonia), 
                                   .St = as.factor(.St))%>%
                         gather(condition, rate, .Mortality.H.Attack:.Mortality.Pneumonia)%>%
                         dplyr::mutate(condition = recode(condition,
                                                  .Mortality.H.Attack = "heart attack",
                                                  .Mortality.H.Failure = "heart failure",
                                                  .Mortality.Pneumonia = "pneumonia"))%>%
                        arrange(-dplyr::desc(rate)))
                        ## na.omit())
    
   df.t <- df.final%>% dplyr::filter(df.final[[".St"]] == state 
                                     & df.final[["condition"]] == outcome  
                                     , !is.na(df.final[["rate"]]))
        
    
    # print(head(df.t))
    # 
    # print(tail(df.t))
    # print(summary(df.t))
    # 
    # df.final <- na.omit(df.final)
   
    ## FINISH data clean
                         
    # detach(df.final)
    df.t[1,1]
  ##df.final[df.final$.St == state & df.final$condition == outcome, ][1,1]
     
    #detach(df.final) 
     
 
}