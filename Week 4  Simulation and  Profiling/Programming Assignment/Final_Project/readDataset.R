read.dataset <- function(directory = c("Data"), file){
    
    path.to.file <- file.path(directory, file)
    dataset <- read.csv(path.to.file, colClasses = "character")
    dataset 
}