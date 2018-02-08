cachemean <- function(x, ...){
      m <- x$getmean()
      
      if(!is.null(m)){
        print("Geting cache Data..")
        return(m)
      }
      data <- x$get()
      m <- mean(data, ...)
      x$setmean(m)
      
      m
}