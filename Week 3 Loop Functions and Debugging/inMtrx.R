makeMatrix <- function(mt = matrix()){
  
  inv.mt <- NULL
  
  set <- function(x){
    mt <<- x
    inv.mt <<- NULL
    
  }
  get <- function() mt
  
  set.inv <- function(inv) inv.mt <<- inv.mt
  
  get.inv <- function() inv.mt
  
  list(set=set, get=get, set.inv=set.inv, get.inv=get.inv)
}