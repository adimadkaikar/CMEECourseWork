SomeOperatiion <- function(v){
    if(sum(v)>0){
        return(v * 100)
    } else{
        return(v)
    }
}

M <- matrix(rnorm(50), 2 , 25)
print(apply(M, 1, SomeOperatiion))