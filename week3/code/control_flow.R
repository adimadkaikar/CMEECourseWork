# Cleaning the environment
rm(list = ls())

# Basic if-else loop
a <- TRUE
if(a == T){
    print("a is TRUE")
} else{
    print(" a is FALSE")
}

# If statement
z <- runif(1)
if (z <= 0.5) {
    print("Less than half")
}

# For loop
for(i in seq(10)){
    j <- i * i
    print(paste(i, 'i squared is', j))
}

# For loop looping over a vector
for(species in c('Heliodoxa rubinoides', 
                 'Boissonneaua jardini', 
                 'Sula nebouxii')) {
    print(paste('The species is', species))
}

# Another for loop
v1 <- c('a', 'bc', 'def')
for(i in v1){
    print(i)
}

# while loop
i <- 0
while(i < 10){
    i <- i+1
    print(i^2)
}
