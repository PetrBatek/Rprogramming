if(!file.exists("./data")){dir.create("./data")}
fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv")
download.file(fileUrl2,destfile="./data/solutions.csv")

reviews = read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)

mergedData = merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)
                ##1.soubor Dat, 2.soubor, by.x, by.y, .....
head(mergedData)

##Default - merge all common column names
intersect(names(solutions),names(reviews))

mergedData2 = merge(reviews,solutions,all=TRUE)
head(mergedData2)

##Using join in the plyr package
#Faster but less full featured - defaults to left join, see help file for more
df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))
arrange(join(df1,df2),id)
df3 = data.frame(id=sample(1:10),z=rnorm(10))
dfList = list(df1,df2,df3)