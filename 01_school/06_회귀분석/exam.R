
##################################################
# 회귀분석 입문
##################################################
market <- read.table( "D:/work_R/exam/data_market.txt" , header=T )
market.out <- lm( Y~X1+X2, data=market)
summary(market.out)
x0 <- c(1, 10 , 10)
x0
y0 <- sum( x0 * market.out$coef )
y0

x0 <- data.frame( X1=10, X2=10)
x0
predict( market.out, x0)

# P1390 
yhat <- function(x1, x2) { 
  yvalue <-  -0.651 + 1.551 * x1 + 0.760 * x2 
}
yval <- yhat( 10, 10)
yval


market <- read.table( "D:/work_R/exam/data_market.txt" , header=T ) 
market
X <- market[ 2:3 ] 
X
X <- cbind( 1, X)
X
X <- as.matrix(X)
X
x <- c( 1, 10, 10)
x
x <- matrix(x, ncol=1)
x
mse <- 5.19
xval <- t(x) %*% solve( t(X) %*% X  ) %*% x 
xval
seY <- sqrt( xval * mse)
seY
lower <- yval - qt( 0.975, 7) * seY
upper <- yval + qt( 0.975, 7) * seY
lower
upper



data(mtcars)
?mtcars
str(mtcars)
dim(mtcars)
names(mtcars)
head(mtcars)

write.table( mtcars , "D:/work_R/exam/auto5-5.txt", row.names = FALSE, col.names = FALSE )

?write.table

# 자료의 진단 
forbes <- read.table( "D:/work_R/exam/forbes.txt" , header=T ) 
forbes
attach( forbes )
plot( temp, log100pessure )
identify(temp, log100pessure)

forbes.reg <- lm( log100pessure~temp)
residual <- forbes.reg$resid
istudent.resid <- rstandard( forbes.reg )
estudent.resid <- rstudent( forbes.reg )
hat <- hatvalues( forbes.reg )
resid.analysis <- cbind(residual, istudent.resid, estudent.resid, hat )
resid.analysis <- round(resid.analysis, 4)
resid.analysis

sink( "D:/work_R/exam/forbes_resid.txt" )
resid.analysis
sink()

install.packages("car")
library(car)
qq.plot(  forbes.reg )

outlier.test(  forbes.reg )

influence.measures( forbes.reg )

plot( cookd(forbes.reg) )
abline(h=4/7, lty=2)
identify( 1:17, cookd(forbes.reg) )

# 모형의 진단


# 로지스틱 회귀분석
mower <- read.table( "D:/work_R/exam/machine_owner.txt" , header=T ) 
mower
attach(mower)
owner <- factor(owner)
owner
mower.logit <- glm(owner~income +size, family=binomial) 
summary(mower.logit)
names(mower.logit)
mower.logit$fitted.values

