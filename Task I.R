---
output:
  pdf_document: default
  html_document: default
---
#factoextra to determine the optimal number clusters for a given clustering methods and for data visualization.
#NbClust for computing about 30 methods at once, in order to find the optimal number of clusters.
library(factoextra)
library(NbClust)

library(ggplot2)
#Task I 
attach(Task_I)
Task_I

# Remove the column with name and email, so it will not be included in the clustering
input=Task_I[,3:6]

# run K-means for an arbitrary K=3
kmeans(input,centers=3,nstart=20)


# Standardize the data
df <- scale(input)
head(df)

#plot Elbow to identify the optimum number K
#Elbow Method for finding the optimal number of clusters
set.seed(123)
# Compute and plot wss for k = 2 to k = 6.
k.max <- 6
data <- df
wss <- sapply(1:k.max, 
              function(k){kmeans(data, k, nstart=50,iter.max = 15 )$tot.withinss})
wss
plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")


#let’s choose K = 3 and run the K-means again.
set.seed(123)
clusters=kmeans(data,centers=3,nstart=20)
clusters

#However here we need to identify the novices from the experts
#Therefore lets take K=2

novices_experts=kmeans(data,centers=2,nstart=20)
novices_experts

## Clustering vector:
# 2 1 2 1 2 2 2 1

str(novices_experts)
fviz_cluster(novices_experts, data = data.frame(data))


