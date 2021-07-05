compute_dissimilarity<-function(fname,nsamples){
  #Input: 
  #       fname=name of csv file
  #       nsamples = number of prototipes to be selected
  #Output: 
          # Results = a vector with the average of 4 perfomance measures
  
  #R code for load the dataset
  M <- load_taskreg(fname)
 
  #R code for define the 5-fold cross validation
  P <- new_partitions(M,5L)
  
  #We use the linear regression model
  learner_reg = lrn("regr.lm")
  
  #Matrix where are stored the experimental results
  outputs<-matrix(data=NA, nrow=5, ncol=4)
 
  for(i in 1:5){
    
      #We compute the dissimilarity matrix
      #D containst the training and testin dataset
      D<-diss_matrix(M,P,i,nsamples)
      
      #Then we separate from D the training and testing dataset
      trainidx<-1:length(P$train_set(i))
      testidx <-setdiff(seq_len(D$nrow),trainidx)
    
      #We train the regression model using D (training dataset)
      learner_reg$train(D,row_ids=trainidx)
    
      #We test the prediction model using D (testing dataset)
      prediccion <- learner_reg$predict(D,row_ids=testidx)
    
      outputs[i,1]<-prediccion$score(msr("regr.mae"))
      outputs[i,2]<-prediccion$score(msr("regr.mse"))
      outputs[i,3]<-prediccion$score(msr("regr.rmse"))
      outputs[i,4]<-prediccion$score(msr("regr.rse"))
    
  }
  Results <-colMeans(outputs)
  print(Results)
}