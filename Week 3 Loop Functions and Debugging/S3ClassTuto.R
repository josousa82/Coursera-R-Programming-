# You can set the class attribute using the class command.
# One thing to notice is that the class is a vector which 
# allows an object to inherit from multiple classes, and 
# it allows you to specify the order of inheritance for 
# complex classes. You can also use the class command to 
# determine the classes associated with an object.

  # > bubba <- c(1,2,3)
  # > bubba
  # [1] 1 2 3
  # >
  # > class(bubba)
  # [1] "numeric"
  # >
  # > class(bubba) <- append(class(bubba),"Flamboyancy")
  # > class(bubba)
  # [1] "numeric" "Flamboyancy"
  
# Note
# 
# A new command, append, is used here. The first argument is a vector, 
# and the function adds the following arguments to the end of the vector.

# One way to define a method for a class is to use the UseMethod command to 
# define a hierarchy of functions that will react appropriately. The UseMethod 
# command will tell R to look for a function whose prefix matches the current 
# function, and it searches for a suffix in order from the vector of class names. 
# In other words a set of functions can be defined, and the function that is actually 
# called will be determined by the class name of the first object in the list of arguments.


