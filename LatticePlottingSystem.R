library(lattice)
library(datasets)
## Simple scatterplot
xyplot(Ozone ~ Wind, data = airquality)

##Convert 'Month' to a factor variable
airquality = transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

##Lattice Behavior
p = xyplot(Ozone ~ Wind, data = airquality)  ##Nothing happens
print(p)    ##Plot appears