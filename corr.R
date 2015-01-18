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

corr <- function(directory, threshold = 0) {
  ##create the vector to return
  v <- numeric()
  ## build the path
  path <- paste( directory, "/", sep="")
  ## grab all the files in the directory
  files<-list.files(path)
  for (fileName in files) {
    data <- read.csv(paste(path, fileName, sep=""))
    if (sum(complete.cases(data))>threshold) {
      corr <- cor(data$sulfate, data$nitrate, use = "complete")
      ##append the corr to the return vector
      v<-c(v,corr)
    }
  }
  return(v)
}

