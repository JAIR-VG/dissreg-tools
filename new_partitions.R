new_partitions<-function(mytask, nfolds){
        
        resampling = rsmp("cv", folds = nfolds)
       
         #This is used for reproducibility. We always obtain the same partitions
        set.seed(123)
        
        resampling$instantiate(mytask)
}