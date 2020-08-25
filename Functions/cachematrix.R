## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  setData <- function(y) {
    x <- y
    inv <- NULL
  }
  getData <- function(){
    x
  } 
  setInverse <- function(inverse){
    inv <- inverse
  } 
  getInverse <- function(){
    inv
  } 
  list(setData = setData,
       getData = getData,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}