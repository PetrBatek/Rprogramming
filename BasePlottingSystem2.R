##Base plot with annotation
library(datasets)
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City")  ##add a title

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))  ##repaints dots of Month 5 -> May to blue color


with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n")) ##type = "n" -> nic nevykresli
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))  ##repaints dots of Month 5 -> May to blue color
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue","red"), legend = c("May", "Other Months"))


##Base Plot with Regression Line
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20))
model = lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

##Multiple Base Plots
par(mfrow = c(1,2))  ## 1 row and 2 columns
with(airquality, {
    plot(Wind, Ozone, main = "Ozone and Wind")
    plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})

par(mfrow = c(1,3), mar = c(4,4,2,1), oma = c(0,0,2,0)) ##1row 3 columns, margins, outer margin
with(airquality, {
    plot(Wind, Ozone, main = "Ozone and Wind")
    plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
    plot(Temp, Ozone, main = "Ozone and Temperature")
    mtext("Ozone and Weather in New York City", outer = TRUE)
})