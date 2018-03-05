require(dplyr)
require(rlang)

lsource <- c("best.R", "cachedf.R", "readDataset.R", "data.clean.R")
lapply(lsource, source)

rankhospital <- function(state, outcome, num) {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    df.final <- clean("Data", "outcome-of-care-measures.csv")
    
    
    cond <- levels(ch.df$get.df()[, 3])
    state.check <- levels(ch.df$get.df()[, 2])

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
    
    df.t <- df.final%>% dplyr::filter(df.final[[".St"]] == state 
                                      & df.final[["condition"]] == outcome, 
                                      !is.na(df.final[["rate"]]))

    df.tt <- cbind(df.t[order(df.t$rate, df.t$.Hospital), ], rank = c(1:length(df.t$rate)))
    
    if(num == "worst") {
        subset(df.tt$.Hospital, df.tt$rank == length(df.tt[,4]))
    }else if(num == "best"){
        best(state, outcome)
    }else{
      subset(df.tt$.Hospital, df.tt$rank == num)
    }
    
    
    
}