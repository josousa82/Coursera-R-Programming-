cache.df <- function(x = as.data.frame()){
    
    clean.df <- NULL
    
    set <- function(df){
        x <<- df
        clean.df <<- NULL
    }
    
    ## raw dataframe, create filter to return specific requested colunms 
    get <- function() x
    
    
    set.df <- function(cldf){
        clean.df <<- cldf
    }
    
    ## cleaned dataframe, create filter to return specific requested colunms 
    get.df <- function() clean.df
    
    list(set = set, get = get, set.df = set.df, get.df = get.df)
}
