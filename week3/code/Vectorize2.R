# Runs the stochastic Ricker equation with gaussian fluctuations
# cleaning the environment 
rm(list = ls())

# Setting the seed 
set.seed(123456)

# Non-vectotized stochastic Ricker equation with gaussian fluctuations
stochrick <- function(p0 = runif(1000, .5, 1.5), r = 1.2, 
                      K = 1, sigma = 0.2,numyears = 1000){

  N <- matrix(NA, numyears, length(p0))  #initialize empty matrix

  N[1, ] <- p0

  for (pop in 1:length(p0)) { #loop through the populations

    for (yr in 2:numyears){ #for each pop, loop through the years

      N[yr, pop] <- N[yr-1, pop] * exp(r * (1 - N[yr - 1, pop] / K)
                                       + rnorm(1, 0, sigma))
      
      # add one fluctuation from normal distribution
    
     }
  
  }
 return(N)
}

# Now write another function called stochrickvect that vectorizes the above to
# the extent possible, with improved performance: 

# Re-setting the seed
set.seed(123456)

# Vectorized function for stochastic simulation of the Ricker model with 
# gaussian fluctuations
stochrickvect <- function(p0 = runif(1000, .5, 1.5), r = 1.2, 
                          K = 1, sigma = 0.2,numyears = 1000){
    # Generating empty matrix of fixed dimensions 
    N <- matrix(NA, numyears, length(p0))
    # Assigning p0 to the first row
    N[1,] <- p0
    
    # Vectorizing over p0 and looping over the years
    for(i in 2:numyears){
        N[i,] <- N[i-1,] * exp(r * (1 - N[i-1,] / K) + 
                                   rnorm(length(p0), 0, sigma))
    }
    return(N)
}

# Results for vectorized model
print("Vectorized Stochastic Ricker takes:")
print(system.time(res2<-stochrickvect()))

# Results for non-vectorized model
print("Not vectorized Stochastic Ricker takes:")
print(system.time(res1<-stochrick()))
