require("ggplot2")
require("plyr")
require("reshape2")
require("datasets")

splitFunction <- function(dataFrame, spl = as.character(),  namesVect = as.vector(), rm.rows = FALSE){
  
  # Divides the elements of data frame, by a column variable 
  
  splList <- split(na.omit(dataFrame), dataFrame[, spl])
  
  # Removes elements with 0 rows, if flag is set to TRUE, default FALSE
  #dataList[sapply(dataList, nrow) > 0] experiencia
  #experimentar remover com row.names lenght
  # Number of rows length to eliminate difined by tresh.rows
  
  splList <- splList[sapply(splList, function(x) !all(is.na(x)))]
  
  If(rm.rows){
    splList <- splList[lapply(splList, nrow) > tresh.rows]
  }
  
}

gGraph <- function(dataFrame, spl = as.character(),  namesVect = as.vector(), rm.rows = FALSE, tresh.rows = 0){
  
 
  
  if(!is.data.frame(dataFrame)){
     if(is.list(dataFrame)){
       dataFrameSet <- do.call(cbind, dataFrame)
       dataFrameSet.melt <- melt(dataFrame)
     }
    
    #adding names to the columns of the data frame
    names(dataFrameSet) <- namesVect
    
    dataFrameSet.melt
      
     #dataSet <- as.data.frame(dataFrame)
    
  }
}

