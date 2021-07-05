get_dissimilarity<- function(T,Y,R){

  #We comput the distance
  D<-pdist(T,R)
  
  #Convert to data frame
  D<-as.data.frame(as.matrix(D))
  #We add the dependent variable
  D$y <-Y
  #Return the dissimilarity matrix
  D
}