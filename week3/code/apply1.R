# Building a random matrix
M <- matrix(rnorm(100), 10, 10)

# Mean of each row
RowMeans <- apply(M, 1, mean)
print(RowMeans)

# Variance of each row
RowVar <- apply(M, 1, var)
print(RowVar)

# Mean of each column 
ColMeans <- apply(M, 2, mean)
print(ColMeans)

# Variance of each column
ColVAr <- apply(M, 2, var)
print(ColVAr)