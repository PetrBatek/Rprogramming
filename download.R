##CSV File

if(!file.exist("data")){dir.create("data")}
fileUrl <-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "E:/R/data/cameras.csv")
list.files("E:/R/data")

dateDownloaded <- date()
dateDownloaded

##Excel File
if(!file.exist("data")){dir.create("data")}
fileUrl <-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "E:/R/data/cameras.xlsx")
list.files("E:/R/data")

dateDownloaded <- date()
