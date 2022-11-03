# Cleaning the environment
rm(list = ls())

# Generate a matrix of random uniform numbers
M <- matrix(runif(1000000), 1000, 1000)

# Function for summing all elements using the loopy way
SumAllElements <- function(M){
    Dimensions <- dim(M)
    Tot <- 0
    for (i in 1:Dimensions[1]){
        for (j in 1:Dimensions[2]){
            Tot <- Tot + M[i, j]
        }
    }
    return(Tot)
}

# Printing loopy way results
print("Using loops the time taken is: ")
print(system.time(SumAllElements(M)))

# Printing vectorized way results
print("Using the built in vectorized function, the time taken is: ")
print(system.time(sum(M)))