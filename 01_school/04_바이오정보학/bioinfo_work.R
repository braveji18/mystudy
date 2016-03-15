
source("http://bioconductor.org/biocLite.R")
biocLite()
biocLite("ALL")
library(ALL)

data(ALL)
dat=exprs(ALL)
dim(dat)

cl <- c( rep(0, 95), rep(1,33))

biocLite("multtest")
library(multtest)
resT <- mt.maxT( dat, classlabel=cl, B=100 )
head( resT, 10 )
tail( resT, 6 )
#####################################################

x <- dat[1:50, 96:128]
standardize <- function(x) { 
  (x - mean(x, na.rm=T)) / sqrt(var(x, na.rm=T))  
}

x <- t( apply(x, 1, standardize) )
heatmap(x, main="Heatmap")


#####################################################
biocLite("OutlierD")
library(OutlierD)

x <- log2(dat)

fit1 <- OutlierD(x1=x[,1], x2=x[,2], method="constant")
fit2 <- OutlierD(x1=x[,1], x2=x[,2], method="linear")
fit3 <- OutlierD(x1=x[,1], x2=x[,2], method="nonlin")
fit4 <- OutlierD(x1=x[,1], x2=x[,2], method="nonpar")

Outlier_t = fit4$x[ fit4$x$Outlier==TRUE,]
Outlier_f = fit4$x[ fit4$x$Outlier==FALSE,]
head(Outlier_t)

outlier_plot <- function( fit, title_name ) { 

  plot(fit$x$A, fit3$x$M, pch=".", xlab="A", ylab="M")
  i <- sort.list(fit3$x$A)
  lines(fit$x$A[i], fit$x$Q3[i], lty=2); lines(fit$x$A[i], fit$x$Q1[i], lty=2)
  lines(fit$x$A[i], fit$x$LB[i]); lines(fit$x$A[i], fit$x$UB[i])
  title( title_name )

} 

par(mfrow=c(2,2))
outlier_plot(fit1, "constant")
outlier_plot(fit2, "linear")
outlier_plot(fit3, "nonlin")
outlier_plot(fit4, "nonpar")










