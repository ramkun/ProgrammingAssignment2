### Submitting work to meet deadline.
### Part of code not working:
###	getInv() = This should return the inverse, however it is returning NULL
	
	
####    makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(mx) {   
     xInv <- NULL
     set <- function(my) {
          mx <<- my
          xInv <<- NULL
     }
     get <- function() mx
     setInv <- function(matrInv) xInv <<- matrInv
     getInv <- function() xInv
     list(set = set, 
		  get = get,
          setInv = setInv,
          getInv = getInv)
}

####    cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 

cacheSolve <- function(mx) { 
     xInv <- mx$getInv()
	 matx <- mx$get()
	 ###If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
     if ((!is.null(xInv)) && (matx == matxSolvd)) {
         message("getting cached data")
         return(xInv)
     }

	 matxSolvd <- matx
	 xInv <- solve(matxSolvd)
     mx$setInv(xInv)
     xInv
}