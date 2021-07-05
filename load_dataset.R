load_dataset <- function(fname)
{
        read.csv(fname,header = TRUE,stringsAsFactors = FALSE)
}