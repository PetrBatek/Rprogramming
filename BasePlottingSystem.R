library(datasets)
hist(airquality$Ozone)

with(airquality, plot(Wind, Ozone))

airquality = transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")