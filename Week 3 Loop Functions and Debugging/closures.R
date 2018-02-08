power <- function(ex){
  print(environment())
  function(x){
    x^ex
  }
}
