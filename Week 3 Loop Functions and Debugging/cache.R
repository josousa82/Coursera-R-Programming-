cacheMatrix <- function(m, ...){
  
  mat.m <- m$get.inv()
  if(!is.null(mat.m)){
    message("Getting cached data ...")
    return(mat.m)
  }
  mat.m <- solve(m$get())
  m$set.inv(mat.m)
  mat.m
}