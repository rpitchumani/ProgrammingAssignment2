## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# set the value of the matrix
# get the value of the matrix
# set the value of inverse of the matrix
# get the value of inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  x_inv <- NULL
  set <- function(y) {
    x <<- y
    x_inv <<- NULL
  }
  get <- function() x
  setinverse <- function(mat_inverse) x_inv <<- mat_inverse
  getinverse <- function() x_inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
# solves the matrix
# find inverse, matrix is always invertible
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  x_inv <- x$getinverse()
  if(!is.null(x_inv)) {
    message("getting cached data")
    return(x_inv)
  }
  mat <- x$get()
  x_inv <- solve(mat)
  x$setinverse(x_inv)
  x_inv

}

x = matrix(c(1,0,5,2,1,6,3,4,0),nrow = 3,ncol = 3)
x_inv = makeCacheMatrix(x)
x_inv$get()

cacheSolve(x_inv)