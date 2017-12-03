library(tm)
setwd("C:\\Users\\mstri\\Documents\\stage1")
#Adjust this as necessary, obviously.

filenames <- list.files(getwd(),pattern="*.txt")
files <- lapply(filenames, readLines)
docs <- Corpus(VectorSource(files))
docs <-tm_map(docs, content_transformer(tolower))

toSpace <- content_transformer(function(x, pattern) { return (gsub(pattern, " ", x))})
docs <- tm_map(docs, toSpace, "-")
docs <- tm_map(docs, toSpace, "’")
docs <- tm_map(docs, toSpace, "‘")
docs <- tm_map(docs, toSpace, "•")
docs <- tm_map(docs, toSpace, """)
docs <- tm_map(docs, toSpace, """)

docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, stripWhitespace)
#docs <- tm_map(docs, stemDocument)

#addedstopwords <- c("can", "say", "one")
#docs <- tm_map(docs, removeWords, addedstopwords)

dtm <- DocumentTermMatrix(docs)

#need to convert DTM to a matrix
m <- as.matrix(dtm)

#Using "Ward" method for agglomerative clustering.
hiercluster <- hclust(d, method="ward.D")
plot(hiercluster, hang=-1)

write.csv("hiercluster.csv")
