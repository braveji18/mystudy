
########################################################
## 2: Introduction to Linear Models and Matrix Algebra
########################################################

library( rafalib )
mypar2()

set.seed(1)
g <- 9.8
n <- 25 
tt <- seq( 0, 3.4, len=n )
d <- 56.67  - 0.5 * g * tt^2 + rnorm(n, sd=1 )
d
plot( tt, d, ylab="Distance in meters", xlab="Time in seconds" )


library( UsingR )
x <- father.son$fheight
y <- father.son$sheight

plot( x, y, xlab="Father's height", ylab="Son's height" )


## Random samples from multiple populations
dir <- system.file(package="dagdata")
filename <- file.path(dir, "extdata/femaleMiceWeights.csv" )
dat <- read.csv( filename )
head( dat )
mypar2(1,1)
stripchart( Bodyweight~Diet, data=dat,
           vertical=TRUE, method="jitter",
           pch=1, main="Mice weights")


# Linear Algebra Examples
library(UsingR)
y <- father.son$sheight
print(mean(y))

N <- length(y)
Y <- matrix(y, N, 1)
A <- matrix(1, N, 1)
A
barY <- t(A) %*% Y / N
barY

barY <- crossprod(A, Y) / N
barY

r <- y - barY
crossprod( r) / N
var(y) * (N-1)  / N


# Linear models
library( UsingR )
x <- father.son$fheight
y <- father.son$sheight
X <- cbind( 1,x )
X
betahat <- solve( t(X)%*%X ) %*% t(X) %*% y
betahat
## or
betahat <- solve( crossprod(X) ) %*% crossprod(X, y)
betahat
  
newx <- seq( (min(x), max(x), len=100 )  
X <- cbind(1, newx)
fitted <- X %*% betahat
fitted
plot( x, y, xlab="Father's height", ylab="Son's height")
lines( newx, fitted, col=2)


# Interactions and contrasts
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/spider_wolff_gorb_2013.csv"
filename <- "spider_wolff_gorb_2013.csv"
library(downloader)
if (!file.exists(filename)) download(url, filename)
spider <- read.csv(filename, skip=1)
head( spider  )
boxplot( spider$friction ~ spider$type * spider$leg,
         col=c("grey90", "grey40"), las=2,
         main="Comparison of friction coefficients of different leg pairs"
         ) 

spider.sub <- spider[ spider$leg == "L1",  ]
head( spider.sub )
fit <- lm( friction ~ type, data=spider.sub)
summary( fit )
( coefs <- coef(fit) )

s <- split( spider.sub$friction, spider.sub$type )
s
mean( s[["pull"]] )
X <- model.matrix( ~type, data=spider.sub)
X
colnames(X)
head(X)
mean( s[["push"]] ) - mean( s[["pull"]] )

X <- model.matrix( ~ type, data=spider.sub)
colnames(X)
head( X )
tail( X )

# library(devtools); install_github("ririzarr/rafalib")
library( rafalib )
imagemat( X, main="Model matrix for linear model with one variable" )

# Examining the coefficients
stripchart( split(spider.sub$friction, spider.sub$type),
           vertical=TRUE, pch=1, method="jitter",
           las=2, xlim=c(0,3), ylim=c(0,2)
           )
a <-  -0.25
lgth <- .1
library( RColorBrewer )
cols <- brewer.pal(3, "Dark2")
abline(h=0)
arrows(1+a, 0, 1+a, coefs[1], lwd=3, col=cols[1], length=lgth  )
abline( h=coefs[1], col=cols[1] )
arrows(2+a, coefs[1], 2+a, coefs[1]+coefs[2], lwd=3, col=cols[2], length=lgth)
abline( h=coefs[1]+coefs[2], col=cols[2] )
legend( "right", names(coefs), fill=cols, cex=.75, bg="white")


# A linear model with two variables
X <- model.matrix( ~type + leg, data=spider) 
colnames(X)
head( X )

imagemat( X, main="Model matrix for linear model width two factors")

fitTL <- lm( friction ~ type + leg, data=spider )
summary( fitTL )

( coefs <- coef(fitTL) )

Y <- spider$friction
Y
X <- model.matrix( ~ type + leg, data=spider )
X
beta <- solve( t(X) %*% X ) %*% t(X) %*% Y 
beta
t(beta)
coefs

spider$group <- factor(paste0(spider$leg, spider$type))
stripchart(split(spider$friction, spider$group), 
           vertical=TRUE, pch=1, method="jitter", las=2, xlim=c(0,11), ylim=c(0,2))
cols <- brewer.pal(5,"Dark2")
abline(h=0)
arrows(1+a,0,1+a,coefs[1],lwd=3,col=cols[1],length=lgth)
abline(h=coefs[1],col=cols[1])
arrows(3+a,coefs[1],3+a,coefs[1]+coefs[3],lwd=3,col=cols[3],length=lgth)
arrows(5+a,coefs[1],5+a,coefs[1]+coefs[4],lwd=3,col=cols[4],length=lgth)
arrows(7+a,coefs[1],7+a,coefs[1]+coefs[5],lwd=3,col=cols[5],length=lgth)
arrows(2+a,coefs[1],2+a,coefs[1]+coefs[2],lwd=3,col=cols[2],length=lgth)
segments(3+a,coefs[1]+coefs[3],4+a,coefs[1]+coefs[3],lwd=3,col=cols[3])
arrows(4+a,coefs[1]+coefs[3],4+a,coefs[1]+coefs[3]+coefs[2],lwd=3,col=cols[2],length=lgth)
segments(5+a,coefs[1]+coefs[4],6+a,coefs[1]+coefs[4],lwd=3,col=cols[4])
arrows(6+a,coefs[1]+coefs[4],6+a,coefs[1]+coefs[4]+coefs[2],lwd=3,col=cols[2],length=lgth)
segments(7+a,coefs[1]+coefs[5],8+a,coefs[1]+coefs[5],lwd=3,col=cols[5])
arrows(8+a,coefs[1]+coefs[5],8+a,coefs[1]+coefs[5]+coefs[2],lwd=3,col=cols[2],length=lgth)
legend("right",names(coefs),fill=cols,cex=.75,bg="white")



s <- split(spider$friction, spider$group)
head( s )
s
means <- sapply(s ,mean)
means
ns <- sapply( s, length )[ c(1,3,5,7) ]
(w <- ns/sum(ns))

sum( w * (means[c(2,4,6,8)] - means[c(1,3,5,7)])  )
coefs[2]
coefs

install.packages("contrast")
library( contrast )

L3vsL2 <- contrast( fitTL, 
                    list(leg="L3", type="pull" ),
                    list(leg="L2", type="pull" )) 
L3vsL2

# Rank
Sex <- c(0,0,0,0,1,1,1,1)
A <-   c(1,1,0,0,0,0,0,0)
B <-   c(0,0,1,1,0,0,0,0)
C <-   c(0,0,0,0,1,1,0,0)
D <-   c(0,0,0,0,0,0,1,1)
X <- model.matrix(~Sex+A+B+C+D-1)
cat("ncol=",ncol(X),"rank=", qr(X)$rank,"\n")

Sex <- c(0,1,0,1,0,1,0,1)
A <-   c(1,1,0,0,0,0,0,0)
B <-   c(0,0,1,1,0,0,0,0)
C <-   c(0,0,0,0,1,1,0,0)
D <-   c(0,0,0,0,0,0,1,1)
X <- model.matrix(~Sex+A+B+C+D-1)
cat("ncol=",ncol(X),"rank=", qr(X)$rank,"\n")



## The QR decomposition
n <- 50;M <- 500
x <- seq(1,M,len=n)
X <- cbind(1,x,x^2,x^3)
beta <- matrix(c(1,1,1,1),4,1)
set.seed(1)
y <- X%*%beta+rnorm(n,sd=1)
y

solve(crossprod(X)) %*% crossprod(X,y)

log10(crossprod(X))











