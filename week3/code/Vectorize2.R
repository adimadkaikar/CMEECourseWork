# Runs the stochastic Ricker equation with gaussian fluctuations

rm(list = ls())
set.seed(123456)

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

set.seed(123456)
stochrickvect <- function(p0 = runif(1000, .5, 1.5), r = 1.2, 
                          K = 1, sigma = 0.2,numyears = 10000){
    N <- matrix(NA, numyears, length(p0))
    N[1,] <- p0
    V <- vector(, length(p0))
    NextYearPop <- function(p_t,p0){
        V <- p_t * exp(r * (1 - p_t / K) + rnorm(length(p0), 0, sigma))
        return(V)
    }
    
    for(i in 2:numyears){
        #N[i,] <- NextYearPop(N[i-1], p0)
        N[i,] <- N[i-1,] * exp(r * (1 - N[i-1,] / K) + 
                                   rnorm(length(p0), 0, sigma))
    }
    return(N)
}

print("Vectorized Stochastic Ricker takes:")
print(system.time(res2<-stochrickvect()))


#print("Not vectorized Stochastic Ricker takes:")
#print(system.time(res1<-stochrick()))

#par(mfrow=c(1,2))
#hist(res1)
hist(res2)
par(mfrow=c(1,1))