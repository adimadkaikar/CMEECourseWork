# Cleaning the environment
rm(list = ls())

# Conditional function 1: Checks if numbers are even or odd
is.even <- function(n = 2){
    if (n %% 2 == 0){
        return(paste(n , 'is even!'))
    } else{
        return(paste(n, 'is odd! :('))
    }
}

print(is.even(7))

# Conditional function 2: Checks if a number is a power of 2
is.power2 <- function(n = 2){
    if(log2(n) %% 1 == 0){
        return(paste(n, 'is power of 2!'))
    } else{
        return(paste(n, 'is not a power of 2 :('))
    }
}

print(is.power2(7))

# Conditional function 3: Checks if it is a prime number
is.prime <- function(n){
    if(n==0){
        return(paste(n, 'is zero'))
    } else if (n==1){
        return(paste(n, 'is just a unit :('))
    } 
    ints <- 2:(n-1)
    
    if (all(n%%ints !=0)){
        return(paste(n, 'is a prime!'))
    } else {
        return(paste(n, 'is a composite :('))
    }
}

print(is.prime(4))
