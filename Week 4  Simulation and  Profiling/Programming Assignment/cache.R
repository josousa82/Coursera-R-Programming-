cache.df <- function(x = data.frame()){
    
    clean.df <- NULL
    
    set <- function(df){
        x <<- df
        clean.df <<- NULL
    }
    
    get <- function() x
    
    set.df <- function(cldf){
        clean.df <<- cldf
    }
    
    get.df <- function() clean.df
    
    list(set = set, get = get, set.df = set.df, get.df = get.df)
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





