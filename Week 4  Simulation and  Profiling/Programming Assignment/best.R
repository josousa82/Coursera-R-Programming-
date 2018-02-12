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
    
    df.final <- df.final %>% select(names.hosp.30day.state)
    
    
    ## rename col names in final data frame
    
    colnames(df.final) <- c(".Hospital", ".St", ".Mortality.H.Attack", 
                            ".Mortality.H.Failure", ".Mortality.Pneumonia")
    ## suppress warnings of NA's coersion
    
          ## cleaning: 
                # 1st change class of col's in data frame;
                # 2nd make the data frame longer with gather
                #   combine numeric value col's Mortality.H.Attack,
                #   .Mortality.H.Failure, .Mortality.Pneumonia in 
                #   condition col, and values in rate col;
                # 3rd use of mutate to change the names in the
                
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
                       
   df.t <- df.final%>% dplyr::filter(df.final[[".St"]] == state 
                                     & df.final[["condition"]] == outcome, 
                                     !is.na(df.final[["rate"]]))
  ## Finish cleaning
   tt <- as.list(table(df.t$rate))
   
   fval <- as.character(df.t[1, 4])
   
   if(tt[fval] > 1){
       
       tax <- df.t[df.t$rate == fval, ]
       ## tax <- tax %>% arrange(-dplyr::desc(tax[[".Hospital"]]))
       tax <- sort()
       return(sort(tax[,1])[1])
       # return(head(sort(tax[,1])))
   }else{
       
        df.t[1,1]
       
       # head(df.t)
   }
}