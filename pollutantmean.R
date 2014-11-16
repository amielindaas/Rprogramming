### assign-1: pollutantmean function
### Author: Amie Lindaas
### Date: Nov 16, 2014

### assumption: a folder called 'specdata' exists in the working directory
### assumption: 'specdata' contains 332 csv files, in NNN.csv format

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  alldata <- data.frame(Date = character(0), sulfate = numeric (0), nitrate = numeric (0), ID = integer(0))
  fileloc <- paste(directory, "/", sprintf("%03d", id), ".csv", sep = "")
  for (thisfile in fileloc){
    thisdata <- read.csv(thisfile)
    alldata <- rbind(alldata, thisdata)
  } 
  polmean <- mean(alldata[ ,pollutant], na.rm = TRUE)
  return(polmean)
}