
## Compactly Display the Structure of an Arbitrary R Object

## str() function, is a function that allows to look inside the structure 
## of an arbitrary R Object

## here I give some examples of the use of str:
library(datasets)

strFunc <- function(){
  
  


  exp.Vector <- function(){
        
        message('Creating a random vector, 100 length, mean 2, standard deviation 4.')
        x <-  rnorm(100, 2, 4)
        print(x)
        readline(prompt = 'Press enter to continue.')
        message('Summary on x vector..')
        print(summary(x))
        readline(prompt = 'Press enter to continue.')
        message('This is str function')
        str(x)
        message('Finish!!')
        
  }
  
  exp.Matrix <- function(){
    
        message('Creating a square matrix  with 10 rows and 10 col..')
        readline(prompt = 'Press enter to continue.')
        message('m <- matrix(rnorm(100), 10, 10)')
        m <- matrix(rnorm(100), 10, 10)
        print(m)
        readline(prompt = 'Press enter to continue.')
        message('Summary on m..')
        print(summary(m))
        readline(prompt = 'Press enter to continue.')
        message('Str on m..')
        str(m)
        message('Finish!!')
        
  }
  
  exp.Factor <- function(){
        
        message('Creating a factor of 40 numbers, 10 itch,')
        f <- gl(40, 10)
        print(f)
        readline(prompt = 'Press enter to continue.')
        message('summary on the factor..')
        print(summary(f))
        readline(prompt = 'Press enter to continue.')
        message('now printing str of the factor.')
        str(f)
        message('Finish!!')
  }
  
  exp.Airpollution <- function(){
  
        message('Dividing airquality dataset by month factor, with split function..')
        s <- split(airquality, airquality$Month)
        readline(prompt = 'Press enter to continue.')
        print(s)
        readline(prompt = 'Press enter to continue.')
        message('This is summary of s')
        print(summary(s))
        readline(prompt = 'Press enter to continue.')
        message('Str on s dataset')
        str(s)
        message('Finish!!')

  }
  
  list(test.vector = exp.Vector, test.matrix = exp.Matrix, test.factor = exp.Factor, 
       test.airpollution = exp.Airpollution)

}


