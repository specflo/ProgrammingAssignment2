## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##the function takes a matrix x,  moving x and its inv in the "set" environment
## containing also set,get, setinv, and getinv

        makeCacheMatrix <- function(x = matrix()) {
                inv <- NULL
                set <- function(y) {
                        x <<- y
                        inv <<- NULL
                }
                get <- function() x
                setinv <- function(solve) inv <<- solve(x)
                getinv <- function() inv
                list(set = set, get = get,
                     setinv = setinv,
                     getinv = getinv)
        }
        
        
        
        
        


## Write a short comment describing this function

## retrieves inv by means of getinv, picking up from the environment set by the previous func.
## if inv has been computed already, it's  fetched from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
        
        }
