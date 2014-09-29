if(!file.exist("data")){dir.create("data")}
fileUrl <-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "E:/R/data/restaurants.csv")
restData <- read.csv("E:/R/data/restaurants.csv")

head(restData,n=3)
tail(restData,n=4)

summary(restData)
str(restData)

##Vypise zadane ppstni kvantily
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))

##Make table
table(restData$zipCode,useNA="ifany") ##if any ..vypise pocet NA
table(restData$councilDistrict,restData$zipCode) ##2D tabulka

##check for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))

##jsou vsechny zipCode kladne?
all(restData$zipCode > 0)

##Row and Column sums
colSums(is.na(restData))
all(colSums(is.na(restData)) == 0)

##Values with specific characteristics
table(restData$zipCode %in% c("21212","21213")) #Jsou v zipCode hodnoty v rozpeti c?
##Values with specific characteristics
restData[restData$zipCode %in% c("21212","21213"),]

##Cross tabs
data(UCVAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <-xtabs(Freq ~ Gender + Admit, data=DF)
xt

##Flat tables
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~.,data=warpbreaks)
xt

##Size of a data set
fakeData = rnorm(1e5)
object.size(fakeData)

print(object.size(fakeData),units="Mb")