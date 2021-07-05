load_taskreg <- function(filename){
    #Input:
          #filename = name of the dataset in csv
  
        m<-load_dataset(filename)
        
        #This R code is for change the name of the independent/depedent variables
        #This can be ommited
        m<-change_colnames(m)
        
        TaskRegr$new(id="datareg", backend = m, target="y")
}