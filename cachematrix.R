## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function takes a matrix as a argument and returns a list with four functions that either set the value of the
## matrix, get the  value of the matrix, set the value of the mean and get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function
## This function computes the inverse of the "special matrix" returned from the makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
        ## Checks if the inverse exists, if so it retrieves the inverse from the cache
  if(!is.null(i)) {
    message("getting caced data")
    return(i)
  }
      ## Gets the matrix
  data <- x$get()
      ## Computes the inverse of the matrix
  i <- solve(data, ...)
      ## Sets the newly computed inverse of the matrix
  x$setinverse(i)
  i
}
