# x variable
x1 <- c(10, 8, 13, 9, 11, 14, 6, 4, 12, 7, 5)
x2 <- c(8, 8, 8, 8, 8, 8, 8, 19, 8, 8, 8)

# y variable
y1 <- c(8.04, 6.95, 7.58, 8.81, 8.33, 9.96, 7.24, 4.26, 10.84, 4.82, 5.68)
y2 <- c(9.14, 8.14, 8.74, 8.77, 9.26, 8.10, 6.13, 3.10, 9.13, 7.26, 4.74)
y3 <- c(7.46, 6.77, 12.74, 7.11, 7.81, 8.84, 6.08, 5.39, 8.15, 6.42, 5.73)
y4 <- c(6.58, 5.76, 7.71, 8.84, 8.47, 7.04, 5.25, 12.5, 5.56, 7.91, 6.89)

# regressioner
reg1 <- lm(y1 ~ x1)
reg2 <- lm(y2 ~ x1)
reg3 <- lm(y3 ~ x1)
reg4 <- lm(y4 ~ x2)

png("anscombe.png", height=6, width=6, units="in", res=700)
par(mfrow=c(2,2))
plot(x1, y1, ylim=c(0,13), cex=1.5, col="red", xlab="", ylab="", main="Model 1")
abline(reg1)
plot(x1, y2, ylim=c(0,13), cex=1.5, col="red", xlab="", ylab="", main="Model 2")
abline(reg2)
plot(x1, y3, ylim=c(0,13), cex=1.5, col="red", xlab="", ylab="", main="Model 3")
abline(reg3)
plot(x2, y4, ylim=c(0,13), cex=1.5, col="red", xlab="", ylab="", main="Model 4")
abline(reg4)
dev.off()
