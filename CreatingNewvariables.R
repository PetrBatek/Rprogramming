if(!file.exist("data")){dir.create("data")}
fileUrl <-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "E:/R/data/restaurants.csv")
restData <- read.csv("E:/R/data/restaurants.csv")

##Creating sequences
s1 <- seq(1,10,by=2); s1  #seqence od 1 do 10 po krocich = 2
s2 <- seq(1,10,length = 3); s2
x <- c(1,3,8,25,100); seq(along = x)

##Subsetting variables
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

##Creating binary variables
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
    #podminka ifelse(pokud plati toto, vratim TRUE, jinak FALSE)
table(restData$zipWrong, restData$zipCode < 0)

##Creating categorical variables
restData$zipGroups = cut(restData$zipCode,breaks=quantile(restData$zipCode))
table(restData$zipGroups)

table(restData$zipGroups, restData$zipCode)

##Easier cutting
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode,g=4)
table(restData$zipGroups)

##Creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

##Levels of factor variables
yesno <- sample(c("yes","no"),size=10,replace=TRUE)
yesnofac = factor(yesno,levels=c("yes","no"))
relevel(yesnofac, ref="yes")
as.numeric(yesnofac)

##Cutting produces factor variables
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g = 4)
table(restData$zipGroups)

##using the mutate function
library(Hmisc); library(plyr)
restData2 = mutate(restData,zipGroups=cut2(zipCode,g = 4))
table(restData2$zipGroups)

