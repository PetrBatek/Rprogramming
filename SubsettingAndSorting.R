set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3" = sample(11:15))

X<- X[sample(1:5),]; X$var2[c(1,3)] = NA
    ## prohodi radky v X    ##nahradi hodnoty v 1. a 3. radce sloupce var2 hodnotou NA
X[,1]
X[,"var2"]
X[(X$var1 <= 3 & X$var3 > 11),]
X[(X$var2 > 8),]
X[which(X$var2 > 8),]

##Sorting
sort(X$var1)
sort(X$var2,na.last=TRUE)
sort(X$var1,decreasing=TRUE)

##Ordering
X[order(X$var1),]
X[order(X$var1,X$var3),] ##if there are same variables in var1, then use var3

##Ordering with plyr
library(plyr)
arrange(X,var1)
arrange(X,desc(var1))
