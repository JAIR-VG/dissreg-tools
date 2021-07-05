get_datasetR <-function(T, ninst){
  set.seed(345)
  T[sample(1:dim(T)[1],ninst,replace=FALSE)]
}