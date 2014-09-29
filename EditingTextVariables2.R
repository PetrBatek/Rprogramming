if(!file.exists("./data")){dir.create("./data")}
fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv")
download.file(fileUrl2,destfile="./data/solutions.csv")

reviews = read.csv("./data/reviews.csv")
solutions = read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)

names(reviews)
##nahrazeni pismen
sub("_","",names(reviews))
## co chci nahradit, cim, kde

testName = "this_is_a_test"
sub("_","",testName) ##nahradi pouze prvni vyskyt
gsub("_","",testName) ##nahradi vsechny vyskyty

##Finding vAlues
grep("Alameda",cameraData$intersection)
  ## retezec, ktery hleda, kde..
table(grepl("Alameda",cameraData$intersection))

cameraData2 = cameraData[!grepl("Alameda",cameraData$intersection),]

grep("Alameda",cameraData$intersection,value=TRUE) ##misto vyskytu vrati, hodnoty s Alamedou

grep("JeffStreet",cameraData$intersection)
## integer(0) when the value does not appear
length(grep("JeffStreet",cameraData$intersection))
## 0 when the value does not appear

library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek",1,7)  ##take part of the string
paste("Jeffrey","Leek")
paste0("Jeffrey","Leek") ##spojeni retezcu bez mezery
str_trim("Jeff     ")