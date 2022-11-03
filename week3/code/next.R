# Next in a for loop in R

# Cleaning environment
rm(list = ls())

# Actual code begin
for(i in 1:10){
    if((i %% 2) == 0){
        next
    }
    print(i)
}