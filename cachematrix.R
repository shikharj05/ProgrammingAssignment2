## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Creates a cache matrix for cacheSolve function to find inverse
makeCacheMatrix <- function(x = matrix()) {
  ans<-NULL
## Set the value of matrix
  set<-function(y){
    x<<-y
    ans<-NULL
  }
## Get the value of matrix
get<-function() x

## Set the value of inverse matrix
setinv<-function(x)ans<<-x

## Get the value of inverse matrix
getinv<-function() ans
## Return list of functions
list(set=set,get=get,setinv=setinv,getinv=getinv)
}


## Write a short comment describing this function
## This function checks if inverse is already calculated,if TRUE it returns the cache answer else calculates and returns the new inverse.Also sets the inverse of given matrix for further processing.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
##Obtain inverse of x matrix
ans<-x$getinv()
## Check if already calculated, if TRUE return answer
    if(!is.null(ans))
    {
      message("getting cached data")
      return(ans)
    }
##Get the value for the matrix to invert
  mat<-x$get()
##find the matrix using solve() function in R
  ans<-solve(mat,...)
##Set the inverse value for the input matrix
  x$setinv(ans)
##return the answer
  ans
  
}
