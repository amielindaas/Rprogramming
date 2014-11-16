### assign-1: corr function
### Author: Amie Lindaas
### Date: Nov 16, 2014

### assumption: a folder called 'specdata' exists in the working directory
### assumption: 'specdata' contains 332 csv files, in NNN.csv format

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  id <- 1:332
  count <- 0
  vector <- vector()
  fileloc <- paste(directory, "/", sprintf("%03d", id), ".csv", sep = "")
  thisdata <- read.csv(thisfile)
  for (thisfile in fileloc){
    thisdata <- read.csv(thisfile)
    thisnobs <- sum(complete.cases(thisdata))
    if (thisnobs < threshold)  {next}
    count <- count + 1
    thisdata <- thisdata[complete.cases(thisdata),]
    vector[count] <- cor(thisdata$sulfate, thisdata$nitrate)
    }
  return(vector) 
}
