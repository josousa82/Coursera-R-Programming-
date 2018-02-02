require(readr)
require(tibble)
require(dlpyr)
require(tidyr)

cache <- function(){
    ## function where the data frame will be cached,
    
    get.df <- function(){
        
    }
    
    set.df <- function(){
        
    }
    
    get.df.names <- function(){
        
    }
    
}

clean.data <- function(){
    ## check if there is a cached data frame
    ## Read csv
    ## prepare data frame
        ## 1 extrat necessary columms
        ## 2 gather data, with dlyr gather() function(I will use for best function 
        ##   columns: "Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" ,
        ##   "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" 
        ##      levels for this columns will be "heart attack", "heart failure", "pneumonia"
            
    ## cache the data frame
}

best <- function(state, outcome){
    
    try(match(state, outcome$.State))
    try(match(outcome, outcome$.Disease))
    
    

}



