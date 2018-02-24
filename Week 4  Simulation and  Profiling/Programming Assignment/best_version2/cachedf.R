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
