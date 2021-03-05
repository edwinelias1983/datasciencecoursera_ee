makeCacheMatrix <- function(x = matrix){
  m <- NULL # empty inverse of a matrix
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() {x}  # gets the value of the matrix 
  setInverse <- function(inverse) m <<- inverse
  getInverse <- function() {m}
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}
cacheSolve <- function(x, ...) {
  # return a matrix that is an inverse of 'x'
  m <- x$getInverse() # getst the value of a an inverse matrix
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <-x$get() # gets the value of the matrix
  m <- solve(data, ...) # calculates the inverse
  x$setInverse(m)
  m # return the inverse of a matrix 
}