# Trying to build function for AICc and RSS

resi <- function(actual_value, predicted_value){
    RSS <- sum((actual_value - predicted_value)^2)
    return(RSS)
}

MyAIC <- function(RSS, p, sample_size){
    if(sample_size>(p+1)){
        whee <- sample_size + 2 + 
            sample_size * log((2 * pi) / sample_size) + 
            sample_size * log(RSS) + 2 * p * (sample_size/(sample_size-p-1))
    }else whee <- NA
    return(whee)
}
