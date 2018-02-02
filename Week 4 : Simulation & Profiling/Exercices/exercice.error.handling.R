is.error <- function(x) inherits(x, "try-error")
 succeed <- !vapply(results, is.error, logical(1))


show_condition <- function(code){
  
  tryCatch(code, 
      error = function(c) "Error",
      warning = function(c) "warning",
      message = function(c) "message"
  )
  
}