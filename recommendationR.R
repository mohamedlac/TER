library("recommenderlab")

#loading the dataset 
data <- read.csv("Projects/TER/data/user_song_matrix.csv",sep=",")
data
#converting the csv into matrix
user_item_matrix <- as.matrix(data)

#recommenderlab part
r<- as(user_item_matrix, "realRatingMatrix")
getRatingMatrix(r)

scheme <- evaluationScheme(r, method="split", k=NULL,given=-1,train =0.9,good)
scheme
results <- evaluate(scheme, method="POPULAR", type = "topNList",n=c(1,3,5,10,15,20))
results
getConfusionMatrix(results)[[1]]
avg(results)

