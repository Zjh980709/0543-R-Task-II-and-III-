## Task II
attach(Task_II)
head(Task_II)
#Covariance matrix of the variables
S <- cov(Task_II)

#Compute the eigenvalues and corresponding eigenvectors of S.

s.eigen <- eigen(S)
s.eigen

#proportion of the total variance explained by the components.

for (s in s.eigen$values) {
  print(s / sum(s.eigen$values))
}

#A scree graph of the eigenvalues 

plot(s.eigen$values, xlab = 'Eigenvalue Number', ylab = 'Eigenvalue Size', main = 'Scree Graph')
lines(s.eigen$values)

s.eigen$vectors

#Visualize
library(ggfortify)
library(ggplot2)
pca_res <- prcomp(Task_II, scale. = TRUE)

autoplot(pca_res)
