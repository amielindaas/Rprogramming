### assign-1: complete function
### Author: Amie Lindaas
### Date: Nov 16, 2014

### assumption: a folder called 'specdata' exists in the working directory
### assumption: 'specdata' contains 332 csv files, in NNN.csv format

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  data2 <- data.frame(id = integer(0), nobs = numeric(0))
  fileloc <- paste(directory, "/", sprintf("%03d", id), ".csv", sep = "")
  for (thisfile in fileloc){
    thisdata <- read.csv(thisfile)
    thisid <- thisdata[1,4]
    thisnobs <- sum(complete.cases(thisdata))
    thisrow <- data.frame(id = thisid, nobs = thisnobs)
    data2 <- rbind(data2, thisrow)
  } 
  return(data2)
  
  print(fileloc)
}