
## Most S3 classes provide a constructor function:

foo <- function(x){
  
  if(!is.numeric(x)) stop("X must be numeric")
  
  structure(list(x), class = "foo")

  }
