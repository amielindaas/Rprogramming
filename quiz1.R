fileurl <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fquiz1_data.zip"
download.file(fileurl, destfile = "quiz1.zip", method="curl")
unzip("quiz1.zip")
Data1 <- read.csv("hw1_data.csv")
newdata <- Data1[ which(Data1$Ozone>31 & Data1$Temp > 90), ]
newdata <- Data1[ which(Data1$Month==5), ]
