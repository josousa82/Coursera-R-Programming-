
## Read outcome data
## Check that state and outcome are valid
## For each state, find the hospital of the given rank
## Return a data frame with the hospital names and the
## (abbreviated) state name
lsource <- c("best.R", "cachedf.R", "readDataset.R", "data.clean.R")
lapply(lsource, source)

rankall <- function(outcome, num = "best") {
    
    df.final <- clean("Data", "outcome-of-care-measures.csv")
    
    
    cond <- levels(ch.df$get.df()[, 3])
    states <- levels(ch.df$get.df()[, 2])
    
    
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
 
    ##print(head(df.t)[, c(1,2)])
    
    test.rall <- tribble(~hospital, ~state)
    
    rank.hosp <- function(state, outcome, num = "best"){
        
        df.t <- df.final%>% dplyr::filter(df.final[[".St"]] == state 
                                          & df.final[["condition"]] == outcome, 
                                          !is.na(df.final[["rate"]]))
        
        df.tt <- cbind(df.t[order(df.t$rate, df.t$.Hospital), ], rank = c(1:length(df.t$rate)))
        
        if(num == "worst") {
            row.to.add <- subset(df.tt[, c(1, 2)], df.tt$rank == length(df.tt[,4]))
        }else if(num == "best"){
            row.to.add <-  subset(df.tt[, c(1, 2)] , df.tt$rank == 1)
        }else{
            row.to.add <- subset(df.tt[, c(1, 2)] , df.tt$rank == num)
        }
        x <- row.to.add[1, 1]
        y <- row.to.add[1, 2]
        
        test.rall <<- add_row(test.rall, hospital = x, state = y)
    }
    
    mapply(rank.hosp, states, outcome, num) 
    
    test.rall
   

}



