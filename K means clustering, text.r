

#Second argument, following "d", is the k variable, or number of clusters; nstart denotes number of starting configurations)
kcluster <- kmeans(d, 2, nstart=100)

#In this instance, plotting the results requires the "cluster" library. This will use principal component analysis to reduce the number of dimensions and render the clusters in two dimensions.
library(cluster)
clusplot(m, kcluster$cluster, color=T, shade=T, labels=2, lines=0)

#For the lines below, where "wss" stands for "within [cluster] sum of squares," the idea is to run through different numbers of k and plot them out, then on the graph to look for a bend which might signal an optimal number of k to work from. The X:Y following the WSS should reflect the number of clusters to check for, 2 being the logical minimum, and the maximum being whatever number of data points are in the dataset.
#wss <- 2:29
#for (i in 2:29) wss[i] <- sum(kmeans(d,centers=i,nstart=25)$withinss)
#plot(2:29, wss[2:29], type=”b”, xlab=”Number of Clusters”,ylab=”Within groups sum of squares”)

write.csv("kcluster.csv")
