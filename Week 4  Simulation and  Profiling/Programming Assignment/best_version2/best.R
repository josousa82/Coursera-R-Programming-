require(dplyr)
require(rlang)

lsource <- c("cachedf.R", "readDataset.R", "data.clean.R")
lapply(lsource, source)

best <- function(state, outcome){
    
    df.final <- clean.best("Data", "outcome-of-care-measures.csv")
    
    
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

 
       df.t <- df.t[order(df.t$rate, df.t$.Hospital), ]
       
       df.t[1, 1]
        

}