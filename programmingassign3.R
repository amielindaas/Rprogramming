### Assignment 3
### Amie Lindaas
### Nov 2014

### Set remote file location

fileurl <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip"

### check to see if 'assign-3.zip' file exists, if not, download and unzip data
if (!file.exists("assign-3.zip")) {
  download.file(fileurl, destfile = "assign-3.zip", method="curl")
  unzip("assign-3.zip")
}

outcome1 <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome1[, 11] <- as.numeric(outcome1[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(outcome1[, 11])

best <- function(State, outcome1, num = "best") {
      if(!any(State == outcome1$State)) 
      stop('invalid state')
    } 
