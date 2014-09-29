##Start with reshaping
library(reshape2)
head(mtcars)

##Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("hp","mpg","disp"))
head(carMelt,n=3)

tail(carMelt,n=3)

##Casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData

cylData <- dcast(carMelt, cyl ~ variable,mean)
cylData

################################################
################################################
## Averaging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)

##Another way - split
spIns = split(InsectSprays$count,InsectSprays$spray)
        ##    Co chci rozdelit, podle ceho to chci rozdelit
spIns

##Apply
sprCount = lapply(spIns,sum)
            ##list of values, operation I want to do
sprCount

##Another way - combine
unlist(sprCount)
sapply(spIns,sum)

##Another way - plyr package
library(plyr)
ddply(InsectSprays,.(spray),summarize,sum=sum(count))

spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)
head(spraySums)