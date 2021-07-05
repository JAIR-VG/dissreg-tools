diss_matrix<-function(tskrg,resamcv,npartition,nsamples){
  
  #We obtain the train dataset
  tra<-tskrg$data(rows=resamcv$train_set(npartition))
  
  #We remove the dependent variable
  tra<-tra[,-1]
  
  #We store the dependent variable
  ytra<-tskrg$data(rows=resamcv$train_set(npartition), cols="y")
  
  #We get the representation set
  R<-get_datasetR(tra,nsamples)
  
  
  #We compute the new training set using R
  dtra<-get_dissimilarity(tra,ytra,R)
  
  
  #The procces is repetead for mappint the testing dataset
  tst<-tskrg$data(rows=resamcv$test_set(npartition))
  tst<-tst[,-1]
  ytst<-tskrg$data(rows=resamcv$test_set(npartition), cols="y")
  dtst<-get_dissimilarity(tst,ytst,R)
  
  
  #We join both dissimilarity matrix (data frame)
  D<-rbind(dtra,dtst)
  
  #We convert the dissimilarity matrix to mlr3 object
  TaskRegr$new(id ="dissimilarity", backend = D, target="y" )
}