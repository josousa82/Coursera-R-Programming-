# Spliting a vector in 3 levels with gl() function and 
# split() function

sp <- function(x = as.numeric(),l = as.numeric(), q = as.numeric() ) {

f <- gl(l, q)

split(x, f)

}