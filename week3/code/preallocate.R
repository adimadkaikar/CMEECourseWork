NoPreallocFun <- function(x){
    a <- vector()
    for (i in 1:x){
        a <- c(a, i)
        #print(a)
        #print(object.size(a))
    }
}

system.time(NoPreallocFun(100000))