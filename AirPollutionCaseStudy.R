pm0 = read.table("./data/RD_501_88101_1999-0.txt", comment.char = "#", header = FALSE, sep = "|", na.strings = "")
pm1 = read.table("RD_501_88101_2012-0.txt")

dim(pm0)
head(pm0)  ##nemame header(jmena sloupcu)

cnames = readLines("./data/RD_501_88101_1999-0.txt", 1)  ##nacteni 1. radky z .txt
cnames = strsplit(cnames, "|", fixed = TRUE)    ##rozdeleni podle "|"

names(pm0) = cnames[[1]]  ##prirazeni jmen do listu pm0

names(pm0) = make.names(cnames[[1]])  ##vlozi tecku do nazvu sloupcu
head(pm0)

x0 = pm0$Sample.Value  ##vytahnuti potrebnych hodnot do pole x0
class(x0)
str(x0)
summary(x0)
mean(is.na(x0))  ##kolik hodnot chybi v pomeru k celkovemu poctu

pm1 = read.table("./data/RD_501_88101_2012-0.txt", comment.char = "#", header = FALSE, sep = "|", na.strings = "")
dim(pm1)
names(pm1) = make.names(cnames[[1]])
head(pm1)
x1 = pm1$Sample.Value
str(x1)

summary(x1)
summary(x0)
mean(is.na(x1))
boxplot(x0,x1)
boxplot(log10(x0), log10(x1))
negative = x1 < 0  ##logical vector; zaporne hodnoty pm2.5 -> neco je spatne
sum(negative, na.rm = TRUE)  ##pocet hodnot < 0
mean(negative, na.rm = TRUE)

dates = pm1$Date
str(dates)
dates = as.Date(as.character(dates), "%Y%m%d")
str(dates)
par(mar = c(4,4,2,2))
hist(dates,"month")
hist(dates[negative], "month")


##mereni jen z New York City; State.Code == 36
site0 = unique(subset(pm0, State.Code == 36, c(County.Code, Site.ID)))
site1 = unique(subset(pm1, State.Code == 36, c(County.Code, Site.ID)))
head(site0)
site0 = paste(site0[,1], site0[,2], sep = ".")
site1 = paste(site1[,1], site1[,2], sep = ".")
str(site0)
str(site1)

both = intersect(site0, site1)
both
pm0$county.site = with(pm0, paste(County.Code, Site.ID, sep = "."))
pm1$county.site = with(pm1, paste(County.Code, Site.ID, sep = "."))
cnt0 = subset(pm0, State.Code == 36 & county.site %in% both)
cnt1 = subset(pm1, State.Code == 36 & county.site %in% both)

head(cnt0)
split(cnt0, cnt0$county.site)
sapply(split(cnt0, cnt0$county.site), nrow)
sapply(split(cnt1, cnt1$county.site), nrow)

pm1sub = subset(pm1, State.Code == 36 & County.Code == 63 & Site.ID == 2008)
pm0sub = subset(pm0, State.Code == 36 & County.Code == 63 & Site.ID == 2008)

dim(pm1sub)
dim(pm0sub)

dates1 = pm1sub$Date
x1sub = pm1sub$Sample.Value
dates1 = as.Date(as.character(dates1),"%Y%m%d")
plot(dates1, x1sub)


dates0 = pm0sub$Date
x0sub = pm0sub$Sample.Value
dates0 = as.Date(as.character(dates0),"%Y%m%d")
plot(dates0, x0sub)

par(mfrow = c(1,2), mar = c(4, 4, 2, 1))
plot(dates0, x0sub, pch = 20)
abline(h = median(x0sub, na.rm=T))
plot(dates1, x1sub, pch = 20)
abline(h = median(x1sub, na.rm=T))
range(x0sub, x1sub, na.rm = T)
rng = range(x0sub, x1sub, na.rm=T)

par(mfrow = c(1, 2))
plot(dates0,x0sub,pch = 20, ylim = rng)
abline(h = median(x0sub, na.rm=T))
plot(dates1,x1sub,pch = 20, ylim = rng)
abline(h = median(x1sub, na.rm=T))

mn0 = with(pm0, tapply(Sample.Value, State.Code, mean, na.rm = T))
mn1 = with(pm1, tapply(Sample.Value, State.Code, mean, na.rm = T))
d0 = data.frame(state = names(mn0), mean = mn0)
d1 = data.frame(state = names(mn1), mean = mn1)
head(d0)
head(d1)

mrg = merge(d0,d1, by = "state")
dim(mrg)
head(mrg)

par(mfrow = c(1, 1), mar = c(4,4,2,1))
with(mrg, plot(rep(1999, 53), mrg[, 2], xlim = c(1998, 2013)))
with(mrg, points(rep(2012, 53), mrg[, 3]))

##pridani spojovacich car
segments(rep(1999,52), mrg[,2], rep(2012, 53), mrg[,3])
