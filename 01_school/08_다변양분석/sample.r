data <- read.table("D:/work_R/R-Project/08_다변양분석/haldheader.txt", header=T)
x <- data[ ,-1]
y <- data[ , 1]
sample.reg <- lsfit(x, y)
resid <- sample.reg$resid

coeff <- sample.reg$coeff

yhat = y - resid 

plot( resid, yhat)
title("SCATTER PLOT of( RESID, YHAT)\n Y=(X1,x2,x3,x4)")

