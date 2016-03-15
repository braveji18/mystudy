
#############################################
#  1 강
#############################################

a <- c( 1: 10)
a

a <- c(20:10)
a

# 3으로 나눈 경우의 정수형 목과 모듈러
a %/% 3 

a %% 3

x <- -5:5
x
x [ x < 0]

seq( -pi , pi, 1)
seq( -pi, pi, length=10)

rnorm(10, -5, 2.5)
rnorm(20)

x <- c(1:12)
x <- matrix(x, ncol=4, byrow=T)
x
x[ , c(1,3)]

y <- c(1:12)
y <- matrix(y, ncol=4, byrow=T)
t(x) %*% y


squareF <- function(x) { x*x}
squareF(4)


install.packages("cluster")
library(cluster)

math <- c( 68, 64, 48, 46, 78, 60, 90, 50, 66, 70)
physics <- c( 70, 68, 46, 48, 84, 64, 92, 52, 68, 72)
plot( math, physics, main="수학과 물리 산점도")
cor( math, physics)

install.packages("xlsx")
library(xlsx)
# 1 => 첫번째 sheet
survery.data <- read.xlsx( "D:/work_R/R-Project/08_다변양분석/survey.xlsx", 1)
head( survery.data )
attach( survery.data)
mean( age )
sd(age)
summary(age)

tapply( age, sex, mean)
tapply(age, sex, sd)
tapply(age, marriage, mean)
tapply(age, marriage, sd)

sex.marriage <- list( sex, marriage)
sex.marriage
table( sex.marriage)

tapply( age, sex.marriage, mean)
tapply( age, sex.marriage, sd)

table( sex )
table( edu)


SexEdu <- table( sex, edu )
summary( SexEdu )


ex8 <- read.table( "D:/work_R/R-Project/08_다변양분석/ex8.txt", header=T )
attach( ex8 )
colnames(ex8)

edu.tb <- table( edu )
edu.tb
rownames( edu.tb) <- c( "중졸", "고졸", "대졸")
edu.tb

barplot(edu.tb)

plot ( age, salary)
plot( age, salary, type="n" )
points(age[sex==1], salary[sex==1], pch="M", col="BLUE")
points(age[sex==2], salary[sex==2], pch="F", col="RED")
title("나이, 월수입, 산점도 :남녀별 구분")

data <- read.table("D:/work_R/R-Project/08_다변양분석/haldheader.txt", header=T)
x <- data[ ,-1]
y <- data[ , 1]
sample.reg <- lsfit(x, y)
sample.reg
resid <- sample.reg$resid
resid

coeff <- sample.reg$coeff
coeff
yhat = y - resid 
yhat

plot( resid, yhat)
title("SCATTER PLOT of( RESID, YHAT)\n Y=(X1,x2,x3,x4)")

source( "D:/work_R/R-Project/08_다변양분석/sample.r" )

#############################################
#  2 강 :  다변량 데이터 시각화
#############################################
library(xlsx)
setwd("D:/work_R/R-Project/08_다변양분석/")
survery.data <- read.xlsx( "survey.xlsx", 1 )
head(survery.data )
attach( survery.data)
mean(age)
sd(age)
summary(age)

edu.tb <- table( edu )
edu.tb

barplot( edu.tb)
pie( edu.tb)

sex.edu <- list(sex, edu)
sex.edu.tb <- table( sex, edu )
sex.edu.tb

colnames(sex.edu.tb) <- c("무학", "초졸", "중졸", "고졸", "대졸")
rownames(sex.edu.tb) <- c("남성", "여성")
barplot( sex.edu.tb )
title("성별 교육정도 막대그림")

par( mfrow=c(1,2))
pie( sex.edu.tb[1,] )
title("Education of Male")
pie( sex.edu.tb[2,])
title("Education of Female")

hist( salary)
stem( salary)
boxplot( salary ~ sex)
title("성별 상자그림")

# 이변량 그래프
plot(co2)
lines(smooth(co2), col="BLUE")

x <- seq(0, 20, 0.1)
y <- exp( -x/10) * cos(2*x)
plot( x, y, type="l")

install.packages("HSAUR2")
library(HSAUR2)
install.packages("MVA")
library(MVA)
data( USairpollution )
head(USairpollution)
plot(USairpollution$manu, USairpollution$popul)
x <- USairpollution[, c(3,4)]
bvbox(x , xlab="manu", ylab="popul" )
title("bivariate boxplot")
identify(x)
rownames(x)[c(7, 9, 14, 30)]


plot(wind~temp, data=USairpollution, pch=9)
with(USairpollution, symbols(temp, wind, circles=SO2, inches=0.5, add=T) )
title("bubble plot")

# 다차원 그래프
setwd("D:/work_R/R-Project/08_다변양분석/")
social.data = read.table("social_data.txt", header=T)
pairs( social.data )
round( cor(social.data), 3 )



social <- social.data[, -1]
year <- social.data[, 1]
rownames(social) <- year
head( social )
stars( social )


library( aplpack )
faces( social, face.type=1)



x<- -6:16
par(mfrow=c(2, 2))
contour(outer(x, x), method="edge", vfont=c("sans serif", "plain"))
z <- outer(x, sqrt(abs(x)), FUN="/")
image(x, x, z)
contour(x, x, z, col="pink", add=TRUE, method="edge", vfont=c("sans serif", "plain"))
contour(x, x, z, ylim=c(1,6), method="simple", laboex=1)
contour(x, x, z, ylim=c(-6,6), nlev=20, lty=2 , method="simple")

# 겨냥도 그림에 대한 명령어
par(mfrow=c(1, 2))
x <- seq(-10, 10, length=30)
y <- x
f <- function(x, y) {r <- sqrt(x^2+y^2); 10*sin(r)/r}
z <- outer(x, y, f)
z[is.na(z)] <- l
persp(x, y, z, theta=30, phi=30, expand=0.5, col="lightblue")
persp(x, y, z, theta=30, phi=30, expand=0.5, col="lightblue", 
      ltheta=120, shade=0.75, ticktype="detailed", 
      xlab="X", ylab="Y", zlab="Sinc(r)")



# 동적그래픽스
install.packages("rggobi")
library(rggobi)

# 원 그래프
edu <- read.table("D:/work_R/R-Project/08_다변양분석/education.txt", header=T)
edu
name <- edu[ , 1]
grade70 <- edu[ ,2]
grade90 <- edu[ ,3]
par( mfrow=c(1,2) )
pie( grade70, label=name, clockwise=T, col=c(2:5), main="1970년도 여성학력" )
mtext( outer=F, "(a)", side=1, line=-6)
pie( grade90, label=name, clockwise=T, col=c(2:5), main="1990년도 여성학력" )
mtext( outer=F, "(b)", side=1, line=-6)


digit <- read.table("D:/work_R/R-Project/08_다변양분석/digit.txt", header=T)
digit <- as.matrix( digit )
par( mfrow=c(1,1) )
barplot( digit, legend.txt=rownames(digit), col=c(2:6) )



#############################################
#  3 강 : 주성분 분석
#############################################

install.packages("HSAUR")
library( HSAUR )
data( heptathlon )
head( heptathlon )
summary( heptathlon )


heptathlon$hurdles <- max( heptathlon$hurdles ) - heptathlon$hurdles
heptathlon$run200m <- max( heptathlon$run200m ) - heptathlon$run200m
heptathlon$run800m <- max( heptathlon$run800m ) - heptathlon$run800m
heptathlon


library( stats)
hep.data <- heptathlon[ , -8]
heptathlon.pca <- princomp( hep.data, cor=T, socres=T )
names( heptathlon.pca)
heptathlon.pca

summary( heptathlon.pca )

eig.val <- heptathlon.pca$sdev ^ 2
eig.val

screeplot( heptathlon.pca, type="lines", pch=19, main="scree Plot")
heptathlon.pca$loading[, 1:2]

heptathlon.pca$scores[, 1:2]

biplot(heptathlon.pca, cex=0.7, col=c("red", "blue"), main="Biplot" )


#############################################
#  4 강 : 인자분석( 1 )
#############################################


#############################################
#  5 강 : 인자분석( 2 )
#############################################


state.x77
summary( state.x77 )

library(stats)
state.fact = factanal( state.x77, factors=3, rotation="none")
state.fact1 = factanal( state.x77, factors=3, rotation="varimax") # varima 회전
state.fact2 = factanal( state.x77, factors=3, rotation="promax" ) # promax 회전
names( state.fact )

state.fact0 = factanal( state.x77, factors=4)
sosq = function( v ) { sum(v^2) }
loadings = as.matrix( state.fact0$loadings)
evalues = apply(loadings, 2, sosq )
evalues

state.fact1

state.fact11 = factanal( state.x77[,-1], factors=3, rotation="varimax", scores="Bartlett") # varima 회전
state.fact11

state.fact11$scores

#plot(state.fact1, state.fact2)
fact1 <- state.fact11
namevar <- colnames( state.x77[, -1] )
plot( fact1$loadings[,1], fact1$loadings[,2], xlab="factor1", ylab="factor2", pch=19  )
text( fact1$loadings[,1], fact1$loadings[,2], labels=namevar, adj=-0.1, cex=0.0 )
abline( h=0, v=0, lty=2 )

#############################################
#  6 강 : 군집분석( 1 )
#############################################


#############################################
#  7 강 : 군집분석( 2 )
#############################################
beer.data = read.table( "D:/work_R/R-Project/08_다변양분석/beerbrand.txt", header=T, sep="," )
head( beer.data )
summary( beer.data )

hc <- hclust( dist(beer.data), method="single" )
hc

plot( hc )
plot( hc, hang=-1)

install.packages("pls")
library(pls)
zbeer.data <- stdize(as.matrix(beer.data) )
zhc <- hclust( dist(zbeer.data), method="centroid" )
plot( zhc, hang=-1)

zhc.cent24 <- cutree(zhc, 2:4)
zhc.cent24


kmc <- kmeans(zbeer.data, 2)
kmc
plot( zbeer.data, col=kmc$cluster, pch=16)
pairs( zbeer.data, col=kmc$cluster, pch=16)


#############################################
#  8 강 : 다차원 척도법
#############################################
install.packages("xlsx")
library(xlsx)
auto.data <- read.xlsx( "D:/work_R/R-Project/08_다변양분석/auto.xlsx", 1 )
head( auto.data )
X <- auto.data[,-1]
autoName <- auto.data[,1]
zX <- scale(X, center=TRUE, scale=TRUE)
maxX <- apply( X, 2, max )
minX <- apply( X, 2, min )
z01X <- scale(X, center=TRUE, scale=maxX-minX) 

z01X.dist <- dist( z01X, method="euclidean")
z01X.dist <- as.matrix(z01X.dist)
colnames(z01X.dist) <- autoName
rownames(z01X.dist) <- autoName
z01X.dist


mds1 <- cmdscale(z01X.dist, k=2)
plot( mds1[,1], mds1[,2], type="n", xlab="", ylab="", main="cmdscale(auto)" )
text( mds1[,1], mds1[,2], rownames(z01X.dist), cex=0.9 )
abline(h=0, v=0, lty=3)


install.packages("smacof")
library(smacof)
mds2 <- smacofSym(z01X.dist, ndim=2)
plot( mds2$conf[,1], mds2$conf[,2], type="n", xlab="", ylab="", main="smaconf(auto)" )
text( mds2$conf[,1], mds2$conf[,2], rownames(z01X.dist), cex=0.9 )
abline(h=0, v=0, lty=3)

mds2.1 <- smacofSym(z01X.dist, ndim=1)
mds2.2 <- smacofSym(z01X.dist, ndim=2)
mds2.3 <- smacofSym(z01X.dist, ndim=3)
mds2.4 <- smacofSym(z01X.dist, ndim=4)
stress.value <- c(mds2.1$stress.m, mds2.2$stress.m, mds2.3$stress.m, mds2.4$stress.m)
plot( stress.value, type="l" )
points( stress.value, cex=0.9)

plot( mds2$confdis, mds2$delta, xlab="observed distance", ylab="configuration distance" )


source("D:/work_R/R-Project/08_다변양분석/readMatrix.r")
data <- readMatrix()
# D:/work_R/R-Project/08_다변양분석/country1968.txt
country.name <- scan("D:/work_R/R-Project/08_다변양분석/countryname.txt", what="")
colnames(data) = country.name
rownames(data) = country.name
data



library(MASS)
fit <- isoMDS(data, k=2)
fit
x <- fit$points[,1]
y <- fit$points[,2]
plot(x, y, xlab="", ylab="", main="Non-metric MDS(isoMDS)", type="n") 
text(x, y, labels=row.names(data), cex=0.9)
abline(h=0, v=0, lty=3)

#############################################
#  9 강 : 정준상관분석
#############################################




#############################################
#  10 강 : 판별분석(1)
#############################################
disc.data <- read.table("D:/work_R/R-Project/08_다변양분석/data7-1.txt", header=T)
attach(disc.data)
gr1.data <- disc.data[ group=="g1",  ] 
gr2.data <- disc.data[ group=="g2", ] 
gr1.data
gr2.data


gr1.X <- gr1.data[,-1]
gr2.X <- gr2.data[,-1]
gr1.X <- as.matrix(gr1.X)
gr2.X <- as.matrix(gr2.X)
cov( gr1.X )

n1 <- nrow( gr1.X )
n2 <- nrow( gr2.X )
n1

gr.Cov <- ((n1-1) * cov(gr1.X)  + (n2-1) * cov(gr2.X)) / (n1+n2-2) 
gr.Cov

gr1.mean <- apply(gr1.X, 2, mean)
gr2.mean <- apply(gr2.X, 2, mean)
gr1.mean
gr2.mean

diff.mean <- gr1.mean - gr2.mean
gr.Covi = solve(gr.Cov)
coeff <- gr.Covi %*%  diff.mean
round( coeff, 3 )



# 사후확률이용방법
library(MASS)
data7 <- read.table("D:/work_R/R-Project/08_다변양분석/data7-1.txt", header=T)
data7.lda <- lda(group~. , data=data7)
pred.lda <- predict(data7.lda, newdata=data7) 
names( pred.lda )

pred.lda$class
pred.lda$posterior

confm.lda <- table( data7$group, pred.lda$class  ) 
confm.lda

prop.table(confm.lda, 1)

sum(diag(prop.table(confm.lda)) )


#############################################
#  11 강 : 판별분석(2)
#############################################


library(xlsx)
alcohol.data <- read.xlsx("D:/work_R/R-Project/08_다변양분석/alcohol.xls" , 1)
head(alcohol.data)
summary( alcohol.data ) 


library(MASS)
alcohol.lda <- lda(TYPE~. , data=alcohol.data )
alcohol.lda


pred.lda <- predict(alcohol.lda, newdata=alcohol.data)
names( pred.lda )

head(pred.lda$class )

head(pred.lda$posterior )

head(pred.lda$x)


confm.lda <- table(alcohol.data$TYPE, pred.lda$class)
confm.lda


prop.table(confm.lda, 1)

error = 1-sum(diag(confm.lda))/sum(confm.lda)
error 

install.packages("klaR")
library(klaR)
alcohol.forward <- greedy.wilks(TYPE~. , data=alcohol.data, niveau=0.01)
alcohol.forward

alcohol.fwd.lda <- lda( alcohol.forward$formula, data=alcohol.data )
alcohol.fwd.lda

pred.fwd.lda <- predict(alcohol.fwd.lda, newdata=alcohol.data)
confm.fwd <- table( alcohol.data$TYPE, pred.fwd.lda$class )
confm.fwd

error <- 1 - sum( diag(prop.table(confm.fwd)) )
error


source("D:/work_R/R-Project/08_다변양분석/classfunc.r")
X <- alcohol.data[, -1]
classfunc.result <- classfun.lda


plot(alcohol.lda)

plot(alcohol.lda, dimen=1, type="both")

pairs(alcohol.data[2:5], main="Pairs Plot", 
      pch = 21, 
      bg = c("red", "green3", "blue")[unclass(alcohol.data$TYPE)])


library(MASS)
data7 <- read.table("D:/work_R/R-Project/08_다변양분석/data7-1.txt", header=T)
head(data7)

pairs(data7[2:4], main="Pairs Plot",
      pch=21, bg = c("red",  "blue")[unclass(data7$group)]) 
      )

data7.lda <- lda(group~. ,  data=data7)
data7.lda

pred.lda <- predict(data7.lda, newdata=data7)
pred.lda$class

pred.lda$posterior
pred.lda$x

confm.lda <- table( data7$group, pred.lda$class )
confm.lda

prop.table(confm.lda, 1)

error <- 1 - sum( diag(prop.table(confm.lda)) )
error

data7.forward <- greedy.wilks(group ~. , data=data7)
data7.forward

data7.fwd.lda <- lda(data7.forward$formula, data=data7 )
data7.fwd.lda

pred.fwd.lda <- predict(data7.fwd.lda, newdata=data7)
confm.fwd <- table( data7$group, pred.fwd.lda$class)
confm.fwd

error = 1 - sum(diag(prop.table(confm.fwd.lda)))
error

install.packages("candisc")
library(candisc)
data71 <- read.table("D:/work_R/R-Project/08_다변양분석/data7-1.txt", header=T)
head(data71)
data71.mod <- lm( cbind(x1, x2, x3) ~ group, data=71 )


#############################################
#  12 강 : 로지스틱 회귀분석
#############################################

library(xlsx)
mower.data <- read.xlsx("D:/work_R/R-Project/08_다변양분석/mower.xlsx", 1)
head( mower.data )

par( mfrow=c(2,1) )
boxplot( income~owner, data=mower.data )
title("income by Owner")

boxplot( size~owner, data=mower.data )
title("Size by Owner")
par( mfrow=c(1,1) )


mower.logit <- glm(owner~. , family=binomial, data=mower.data )
summary( mower.logit )


mower.predict <- predict( mower.logit, newdata=mower.data, type="response")
round(mower.predict, 3 )

pred <- ifelse( mower.predict < 0.5, "no", "yes" )
pred <- factor(pred)
pred


confusion.matrix <- table(mower.data$owner, pred )
confusion.matrix

diag( prop.table(confusion.matrix, 1) )
error <- 1 - sum(diag(prop.table(confusion.matrix)))
error

install.packages("RWeka")
library(RWeka)
mower.m <- Logistic( owner ~. , data=mower.data )
names(mower.m)
summary( mower.m)
mower.m

mower.p <- predict(mower.m ,newdata=mower.data, type="class"  )
mower.p

mower.com <- table( mower.data$owner, mower.p )
mower.com

mower.error <- 1 - (sum( diag(mower.com)) / sum(mower.com))
mower.error


library(MASS)
data(menarche)
head(menarche)
plot( Menarche/Total ~ Age, data=menarche, pch=19)
menr.out <- glm(cbind(Menarche, Total-Menarche)~Age, family=binomial, data=menarche ) 
summary(menr.out)

plot( Menarche/Total ~ Age, data=menarche, pch=19)
lines(menarche$Age, menr.out$fitted, type="l", col="blue" )
title("Menarche Data with Fitted Logistic Regression")


#############################################
#  13 강 : 나무모형(1)
#############################################



#############################################
#  14 강 : 나무모형(2)
#############################################

install.packages("rpart")
library( rpart )
help ( rpart )


titanic.data <- read.table(
  "D:/work_R/R-Project/08_다변양분석/titanic.csv", header=T, sep=",")
head( titanic.data )
summary( titanic.data )

cartfit <- rpart( survived ~ CLASS+sex+age, data=titanic.data  )
cartfit

plot( cartfit ,uniform=T, compress=T, margin=0.1 )
text(cartfit , use.n=T, col="blue" )
summary( cartfit)



library( rpart )
head( cu.summary, n=10 )
summary( cu.summary )

cartfit1 <- rpart( Price ~ Country + Reliability + Mileage + Type, data=cu.summary)
cartfit1
plot( cartfit1 ,uniform=T, compress=T, margin=0.1 )
text(cartfit1 , use.n=T, col="blue" )
summary( cartfit1)

cartfit2 <- rpart( Price ~ Country + Reliability + Mileage + Type, 
                   control=rpart.control(minsplit=5, xval=0),
                   data=cu.summary)
cartfit2
plot( cartfit2 ,uniform=T, compress=T, margin=0.1 )
text(cartfit2 , use.n=T, col="blue" )
summary( cartfit2)
