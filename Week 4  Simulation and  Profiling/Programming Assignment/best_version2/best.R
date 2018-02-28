require(dplyr)
require(rlang)
source("data.clean.R")

best <- function(state, outcome){
    
    df.final <- clean.best("Data", "outcome-of-care-measures.csv", "best")
    
    
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
    
    ## read csv file
     ## df.final <- clean.best("Data", "outcome-of-care-measures.csv", "best")
    
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