### Assignment 1
### Amie Lindaas
### Nov 2014

### Set remote file location
fileurl <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"

### check to see if 'specdata' folder exists, if not, download and unzip data
if (!file.exists("./specdata")) {
  download.file(fileurl, destfile = "assign-1.zip", method="curl")
  unzip("assign-1.zip")
}

