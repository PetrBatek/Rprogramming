library(RMySQL)
hg19 <- dbConnect(MySQL(),user="genome", db="hg19", host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)

allTables[1:5]

dbDisconnect(hg19) ##DON't forget