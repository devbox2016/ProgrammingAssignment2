## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## function makeCacheMatrix expects a matrix and 
## constructs an"object" of type list which as methods for geters and setters
## the "object" containts the cached inverse of the matrix supplied to this function.
makeCacheMatrix <- function(x = matrix()) {
  
  # m is the cached inverse of matrix x
  m <- NULL

  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) {
    
    m <<- inverse
    
  }
  getinverse <- function() m
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse, x=x, m=m)
}

## Write a short comment describing this function
## this function returns the the inverse of the matrix x that has
## that MUST have been created by makeCaseMatrix
## every subsequent call to this function will return a cached x
cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  # check if the cache has the inverse of x
  m <- x$getinverse()
  
  if (!is.null(m)) {
    
    #++++used cache ++++++"
    return(m) 
  }
  
  # compute the inverse of matrix prepared by makeCacheMatrix
  m <- solve(x$x)
  
  # set the cache 
  x$setinverse(m)
  
  #return the inverse of supplied matrix
  m
  
}
