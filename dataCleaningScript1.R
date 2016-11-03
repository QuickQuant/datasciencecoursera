fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "D:/R/datasciencecoursera/data/cameras.csv")
list.files("./data")
library(data.table)
library(stringr)
library(dplyr)
library(readxl)
library(XML)
camData <- fread("data/cameras.csv")
table(camData$VAL)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "D:/R/datasciencecoursera/data/natgas.xlsx")
dat <- read_excel("data/natgassubset.xls")
sum(dat$Zip*dat$Ext,na.rm=T)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl, destfile = "D:/R/datasciencecoursera/data/natgas.xml")
doc <- xmlTreeParse("data/natgas.xml",useInternal=TRUE)
rootNode <- xmlRoot(doc)
table(xpathSApply(rootNode,"//zipcode",xmlValue))

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "D:/R/datasciencecoursera/data/idaho.csv")
DT <- fread("data/idaho.csv")
library(microbenchmark)
sapply(split(DT$pwgtp15,DT$SEX),mean)
microbenchmark(sapply(split(DT$pwgtp15,DT$SEX),mean),
               {mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)},
               DT[,mean(pwgtp15),by=SEX],
               tapply(DT$pwgtp15,DT$SEX,mean),
               mean(DT$pwgtp15,by=DT$SEX))

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
thelines <- readLines(con)
nchar(c(thelines[c(10,20,30,100)]))
noaaData <- data.table(read.fwf(url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),widths = c(10,13,13,13,13)))
