# cleaning the environment 
rm(list = ls())

# Function to calculate mean if the number of unique values is greater then 30
doit <- function(x){
    temp_x <- sample(x, replace = T)
    if(length(unique(temp_x)) > 30){
        print(paste("Mean of this sample was:", as.character(mean(temp_x))))
    } else{
        stop("Couldn't calculate mean. Too few variables :(")
    }
}

# Setting seed and generating data
set.seed(1345)
popn <- rnorm(50)
hist(popn)

# Running the doit function with lapply and try
result <- lapply(1:15, function(i) try(doit(popn), F))
result

# Running the doit function the loopy way
result <- vector("list", 15) #Preallocate/Initialize
for(i in 1:15) {
    result[[i]] <- try(doit(popn), FALSE)
}
