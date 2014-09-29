cameraData = read.csv("./data/cameras.csv")
names(cameraData)

tolower(names(cameraData))

##Fixing character vectors - strsplit()
#Good for automatically splitting variable names
#Important parameters: x,split

splitNames = strsplit(names(cameraData),"\\.") ##vytvoreni fce splitNames
splitNames[[6]]

##Quick aside - lists
mylist = list(letters = c("A","b","c"),numbers = 1:3, matrix(1:25,ncol=5))
head(mylist)

##Fixing character vectors - sapply()
#Applies a function to each element in a vector or list
#Important parameters: X,FUN
splitNames[[6]][1]

firstElement = function(x){x[1]}
sapply(splitNames,firstElement)
