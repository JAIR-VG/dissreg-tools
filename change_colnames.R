change_colnames <- function(mydata)
{
        #Input
        #mydata = data.frame
        #Output
        #data.frame = Col names were changed
        d<-length(mydata)
        for (i in 1:(d-1)){
                if (i <= 9){
                        c<-"x0"
                }
                else {
                        c<-"x"
                }
                names(mydata)[i] <- paste(c,i,sep="")
        }
        names(mydata)[d]<-"y"
        return(mydata)
}