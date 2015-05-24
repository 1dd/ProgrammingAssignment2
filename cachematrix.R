## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix creates a special "matrix", which is really a list containing a function to

## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        inversematrix <- NULL
        set <- function(y) {
                x <<- y
                inversematrix <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) inversematrix <<- solve
        getinverse <- function() inversematrix
        list(set = set, get = get)
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function

## following function calculates the inverse of the special "matrix" created with the above function. It first checks to see  if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the calculation. Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the solve function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inversematrix <- x$getinverse()
        if(!is.null(inversematrix)) {
                message("getting cached data")
                return(inversematrix)
        }
        m <- x$get()
        inversematrix <- solve(m, ...)
        x$setinverse(inversematrix)
        inversematrix
}
