

#Create and assign a class in one step

foo <- structure(list(), class = "foo")


#Create, then set the class

foo <- list()
class(foo) <- "foo"

# To determine if a function is an S3 generic, you can inspect its source code for
# a call to UseMethod(): that’s the function that figures out the correct method to call, 
# the process of method dispatch. Similar to otype(), pryr also provides ftype() which 
# describes the object system, if any, associated with a function:
# Apart from methods defined in the base package, 
# most S3 methods will not be visible: use getS3method() to read their source code

# pryr::ftype() knows about these exceptions, 
# so you can use it to figure out if a function is an S3 method or generic:
# ftype(t.data.frame) # data frame method for t()
# [1] "s3"     "method"
# ftype(t.test)       # generic function for t tests
# [1] "s3"      "generic"

# You can determine the class of any object using class(x), and see if an object inherits 
# from a specific class using inherits(x, "classname").

class(foo)

## [1] "foo"

inherits(foo, "foo")

## [1] TRUE
