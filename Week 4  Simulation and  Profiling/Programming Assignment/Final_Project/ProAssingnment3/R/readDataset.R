#' Reads Dataset (in characters).
#'
#' @param directory Folder for where the datafile. Default Value "Data"
#' @param file Name of the file to be read
#' @return a DataFrame with the Raw data
#'   
#' @seealso \code{\link{nchar}} which this function wraps
#' @export
#' @examples
#' read.dataset("Folder", "file")

read.dataset <- function(directory = c("Data"), file){
    
    path.to.file <- file.path(directory, file)
    dataset <- read.csv(path.to.file, colClasses = "character")
    dataset 
}