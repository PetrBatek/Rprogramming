##CSV Files

cameraData <- read.table("E:/R/data/cameras.csv", sep = ",", header = TRUE)
## Or: cameraData <- read.csv("E:/R/data/cameras.csv")
                    ## read.csv sets sep = "," and header = TRUE
                    ##neni nutno nastavovat

head(cameraData)

##Excel Files
library(xlsx)
cameraData <- read.xlsx("E:/R/data/cameras.xlsx", sheetIndex=1,header=TRUE)
head(cameraData)
                    
##reading specific rows and columns
library(xlsx)
colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx("E:/R/data/cameras.xlsx", sheetIndex=1, colIndex = colIndex, rowIndex = rowIndex)

cameraDataSubset

##XML files
library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)