# Cleaning the environment
rm(list = ls())

# breaking a while loop
i <- 0
while(i < Inf){
    if(i == 10){
        break
    } else{
        cat('i equals', i, '\n')
        i <- i + 1
    }
}
