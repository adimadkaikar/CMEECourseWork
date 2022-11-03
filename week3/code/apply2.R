# cleaning the environment 
rm(list = ls())

# A weird function
# Returns the vector multiplied by 100 if the sum of the vector 4
#elements is greater then 0
# Else returns the vector as is

SomeOperatiion <- function(v){
    if(sum(v)>0){
        return(v * 100)
    } else{
        return(v)
    }
}

M <- matrix(rnorm(50), 2 , 25)
print(apply(M, 1, SomeOperatiion))