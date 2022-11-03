# A boilerplate R script

# Cleaning data
rm(list = ls())

# Weird function
MyFunction <- function(Arg1, Arg2){
    # Statements involving Arg1 and Arg2
    print(paste("Argument", Arg1, "is a", class(Arg1)))
    print(paste("Argument", Arg1, "is a", class(Arg1)))
    
    return(c(Arg1, Arg2))
}

MyFunction(1,2)
MyFunction('Riki', 'Tiki')