#' Makes the cache of the dataframe, in Raw and cleaned.
#'
#' @param x Data Frame to be stored 
#' @param .set Set the Raw Data in cache
#' @param .get Get the Raw Data stored in Data Frame in cache
#' @param .set.df Set the cleaned Data stored in a Data Frame in cache
#' @param .get.df Get the cleaned Data stored in a Data Frame in cache
#' @return a DataFrame in Raw or cleaned data
#'   
#' @seealso \code{\link{nchar}} which this function wraps
#' @export
#' @examples
#'  d <- data.frame
#'  cached.df <- 
#'  
#'  
#'  
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
