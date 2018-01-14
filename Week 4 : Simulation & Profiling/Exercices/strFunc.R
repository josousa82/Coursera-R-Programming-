
## Compactly Display the Structure of an Arbitrary R Object

## str() function, is a function that allows to look inside the structure 
## of an arbitrary R Object

## here I give some examples of the use of str:

strFunc <- function(){
str(rnorm)

x <-  rnorm(100, 2, 4)
message('Summary on x vector..')
print(summary(x))

message('This is str function')
str(x)

message('Creating a square matrix  with 10 rows and 10 col..')
message('m <- matrix(rnorm(100), 10, 10)')
m <- matrix(rnorm(100), 10, 10)
message('Summary on m..')
summary(m)
message('Str on m..')
str(m)


}