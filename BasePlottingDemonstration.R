par(mfrow = c(1,1))
x = rnorm(100)
hist(x)

y = rnorm(100)
plot(x,y)

z = rnorm(100)
plot(x,z)

par(mar = c(4, 4, 1, 2))
plot(x,y)

plot(x, y, pch = 20)  ##full circle
plot(x, y, pch = 19)  ##bigger full circle
plot(x, y, pch = 2)  ##triangles
plot(x, y, pch = 3)  ##+
plot(x, y, pch = 4)  ##x
plot(x,y, pch = 20)
title("Scatterplot")
text(-1, -2, "Label")
legend("topleft" , legend = "Data", pch = 20)
fit = lm(y ~ x)  ##linear model ->lm
abline(fit)
abline(fit, lwd = 3) ##sirka cary
abline(fit, lwd = 3, col = "blue")
plot(x,y,xlab = "Weight", ylab = "Height", main = "Scatterplot", pch = 20)
legend("topright", legend = "Data", pch =20)
fit = lm(y ~ x)
abline(fit, lwd = 3, col = "red")
z = rpois(100, 2 )
par(mfrow = c(2,1))
plot(x,y, pch = 20)
plot(x, z, pch = 19)
par("mar")
par(mar = c(2,2,1,1))
plot(x,y, pch = 20)
plot(x, z, pch = 19)

par(mfrow = c(1,1), mar = c(4,4,2,2))
x <- rnorm(100)
y <- x + rnorm(100)
g = gl(2, 50)   ##group...be half and half so the two groups in the fifty level fifty iterations of each
g = gl(2, 50, labels = c("Male", "Female"))  ##added names
str(g)
plot(x,y)
plot(x,y, type = "n")
points(x[g == "Male"], y[g == "Male"], col = "green")
points(x[g == "Female"], y[g == "Female"], col = "blue")