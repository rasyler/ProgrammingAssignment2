## As we know, matrix inversion is a costly computation and there
## may be some value to caching the inverse matrix rather than computer it repeatedly.
## The following functions accomplish this task.

## The makeCacheMatrix function creates a special matrix object
## that can cache its inverse.
## First, the function sets the value of the matrix
## Next, it gets the value of the matrix
## Then it sets the value of inverse of the matrix and lastly 
## gets the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## The cacheSolve function returns the inverse of the matrix. 
## First, it checks whether the inverse has already been computed. 
## If so, it gets the result and skips the computation.
## If not, it computes the inverse, sets the value in the cache via setinverse function.

## This function assumes that the matrix is always invertible.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)m
  x$setinverse(inv)
  inv
}
