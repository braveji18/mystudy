
########################################################
## 3: Advanced Statistics for the Life Sciences
########################################################

library(rafalib)
mypar2()

library(devtools)
install_github("genomicsclass/GSE5859Subset")
library(GSE5859Subset)
data(GSE5859Subset)
dim( geneExpression )
head( geneExpression )

dim(sampleInfo)
head( sampleInfo )
sampleInfo$group

match(sampleInfo$filename,colnames(geneExpression))

dim( geneAnnotation )
head( geneAnnotation )

head(match(geneAnnotation$PROBEID,rownames(geneExpression)))

g <- sampleInfo$group
g

e <- geneExpression[25, ]
e
e[g==1]
e[g==0]
mypar2(1,2)
qqnorm( e[g==1] )
qqline( e[g==1] )
qqnorm( e[g==0] )
qqline( e[g==0] )

t.test(e[g==1],e[g==0])


myttest <- function(x)  t.test( x[g==1], x[g==0], var.equal=TRUE)$p.value
pvals <- apply( geneExpression, 1, myttest )
sum( pvals < 0.05 )


set.seed(1)
m <- nrow(geneExpression) 
n <- ncol(geneExpression)
randdomData <- matrix( rnorm(n*m), m, n )
nullpvals <- apply( randdomData, 1, myttest )
sum( nullpvals < 0.05   )

source("http://bioconductor.org/biocLite.R")
biocLite("genefilter")

library( genefilter )
results <- rowttests( geneExpression, factor(g) )
max( abs(pvals-results$p))


## Basic EDA for high-throughput data
library( genefilter )
library( GSE5859Subset )
data( GSE5859Subset ) 
g <- factor( sampleInfo$group )
g
results <- rowttests( geneExpression, g )
rownames( results  )
colnames( results )

pvals <- results$p.value
pvals

plot( results$dm, -log10(results$p.value),
      xlab="Effect size", ylab="-log(base 10) p-values" )


mypar2(1,2)
hist( nullpvals, ylim=c(0, 1400) )
hist( pvals, ylim=c(0, 1400) )

permg <- sample(g)
permg
permresult <- rowttests( geneExpression, permg ) 
hist( permresult$p.value ) 

source("http://bioconductor.org/biocLite.R")
library( Biobase )
devtools::install_github("genomicsclass/GSE5859")
library( GSE5859 )
data( GSE5859 )
ge <- exprs( e )
dim( ge )

ge[, 49] <- ge[,49] / log2(exp(1))

library( rafalib )
mypar2(1,1)
boxplot(ge, range=0, names=1:ncol(e), col=ifelse(1:ncol(ge)==49,1,2 ) )

qs <- t( apply(ge, 2, quantile, prob=c(0.05,0.25,0.5,0.75,0.95))  ) 
matplot(qs, type="l", lty=1)

mypar2(1,1)
shist(ge,unit=0.5)

# MA plot
x <- ge[,1]
y <- ge[,2]
mypar(1,2)
plot(x,y)
plot((x+y)/2,x-y)

sd(y-x)


## Quick introduction to Bioconductor

source("http://bioconductor.org/biocLite.R")
biocLite("Biobase")

library(Biobase)
library(GSE5859)
data(GSE5859)
class(e)

dat <- exprs(e)
dim(dat)

sampleInfo <- pData(e)
dim(sampleInfo)

head( sampleInfo)

biocLite("hgfocus.db")
library(hgfocus.db)

annot <- elect( hgfocus.db, keys=featureName(e), keytype="PROBEID",
                columns=c("CHR", "CHRLOC", "SYMBOL") )

annot <-annot[match(featureNames(e),annot$PROBEID),]

head( annot )
dim( annot )


## Mathematical definition of distance
library(devtools)
install_github("genomicsclass/tissuesGeneExpression")
library(tissuesGeneExpression)
data(tissuesGeneExpression)
table(tissue)

x <- e[,1]
x
y <- e[,2]
y
z <- e[,87]
z
sqrt( sum( (x-y)^2 ) )
sqrt( sum( (x-z)^2) )
sqrt( crossprod(x-z) )

d <- dist( t(e))
class(d)

as.matrix(d)[1,2]
as.matrix(d)[1,87]


## Introduction to the singular value decomposition (SVD)
x <- rnorm( 100 )
x
y <- rnorm( 100 )
z <- cbind( x, x, x, y, y)
z
SVD <- svd (z )
round( SVD$d, 2)
newz <- SVD$u[, 1:2] %*% diag( SVD$d[1:2] ) %*% t(SVD$v[, 1:2]) 
max( abs(newz-z) )


library(tissuesGeneExpression)
data(tissuesGeneExpression)
set.seed(1)
nrow(e)
ind <- sample( nrow(e), 500 ) 
ind
Y <- t( apply(e[ind, ], 1, scale) )

s <- svd( Y )
U <- s$u
V <- s$v
D <- diag( s$d )

Yhat <- U %*% D %*% t(V)
resid <- Y - Yhat
max( abs(resid) ) 


i <- sample(ncol(Y),1)
i
plot(Y[,i],Yhat[,i])
abline(0,1)

boxplot(resid)

plot(s$d)


# Highly correlated data
m <- 100
n <- 2
x <- rnorm( m )
x
e <- rnorm( n*m, 0, 0.01 )
e
Y <- cbind(x,x) + e
cor(Y)

d <- svd(Y)$d
d[1]^2 / sum(d^2)


m <- 100
n <- 25
x <- rnorm(m)
e <- rnorm(n*m,0,0.01)
Y <- replicate(n,x)+e
d <- svd(Y)$d
d[1]^2/sum(d^2)


## Dimension reduction with multidimensional scaling (MDS)

s <- svd(mat-rowMeans(mat))



## Clustering and heatmaps
library(tissuesGeneExpression)
data(tissuesGeneExpression)
d <- dist(t(e))

# Hierarchical clustering
library(rafalib)
mypar2(1,1)
hc <- hclust(d)
hc
plot( hc, labels=tissue)

myplclust(hc, labels=tissue, lab.col=as.fumeric(tissue))
abline(h=120)

hclusters <- cutree(hc, h=120)
table( true=tissue, cluster=hclusters )

# K-means
plot(e[1,], e[2,])
set.seed(1)
km <- kmeans(  t(e[1:2, ]), centers=7  )
names(km)
plot( e[1,], e[2,], col=km$cluster,  pch=16  )
plot(e[1,], e[2,], col=as.fumeric(tissue), pch=16)
table(true=tissue, cluster=km$cluster)

mds <- cmdscale(d)
plot(mds[,1], mds[,2]) 

km <- kmeans(t(e), centers=7)
plot(mds[,1], mds[,2], col=km$cluster, pch=16)

# Heatmaps

library(RColorBrewer)
hmcol <- colorRampPalette(brewer.pal(9, "GnBu"))(100)
library(genefilter)
rv <- rowVars( e )
rv
idx <- order(-rv)[1:40]
idx
heatmap( e[idx,], col=hmcol )

install.packages("gplots")
library(gplots)

cols <- palette(brewer.pal(8, "Dark2"))[as.fumeric(tissue)]
head(cbind(colnames(e),cols))
heatmap.2( e[idx,], labCol=tissue,
           trace="none", ColSideColors=cols, col=hmcol)

# Introduction to Machine Learning
library(rafalib)
mypar(1,1)
library(UsingR)
data("father.son")
x=round(father.son$fheight) ##round to nearest inch
y=round(father.son$sheight)
hist(y,breaks=seq(min(y),max(y)))
abline(v=mean(y),col=2)


plot(x,y,xlab="Father's height in inches",ylab="Son's height in inches",main=paste("correlation =",signif(cor(x,y),2)))
abline(v=c(-0.35,0.35)+71,col="red")
abline(lm(y~x),col=1)

hist(y[x==71],xlab="Heights",nc=8,main="",xlim=range(y))

# Smoothing
library(Biobase)
biocLite("SpikeIn")
library(SpikeIn)
data(SpikeIn95)

i <- 10; j <- 9
siNames <- colnames(pData(SpikeIn95))
siNames
ind <- which( !probeNames(SpikeIn95) %in% siNames  )
ind
pms <- pm( SpikeIn95)[ ind, c(i, j) ]
pms

Y <- log2( pms[,1] ) - log2( pms[,2] )
X <- (log2( pms[,1] ) + log2( pms[,2] )) /2 
set.seed(1)

ind <- tapply( seq(along=X), round(X*5), 
               function(i) if( length(i)>20 ) return( sample(i,20) ) else return(NULL)  
  )

ind <- unlist(ind)
ind
X <- X[ind]
Y <- Y[ind]
o <- order(X)
X <- X[o]
Y <- Y[o]

library(rafalib)
mypar2(1,1)
plot(X,Y)


# Bin Smoothing
mypar2(1,1)
centers <- seq(min(X),max(X),0.1)
plot(X,Y,col="grey",pch=16)
windowSize <- .5
i <- 25
center<-centers[i]
ind=which(X>center-windowSize & X<center+windowSize)
fit<-mean(Y)
points(X[ind],Y[ind],bg=3,pch=21)
lines(c(min(X[ind]),max(X[ind])),c(fit,fit),col=2,lty=2,lwd=4)
i <- 60
center<-centers[i]
ind=which(X>center-windowSize & X<center+windowSize)
fit<-mean(Y[ind])
points(X[ind],Y[ind],bg=3,pch=21)
lines(c(min(X[ind]),max(X[ind])),c(fit,fit),col=2,lty=2,lwd=4)


windowSize<-0.5
smooth<-rep(NA,length(centers))
mypar2(4,3)
for(i in seq(along=centers)){
  center<-centers[i]
  ind=which(X>center-windowSize & X<center+windowSize)
  smooth[i]<-mean(Y[ind])
  if(i%%round(length(centers)/12)==1){ ##we show 12
    plot(X,Y,col="grey",pch=16)
    points(X[ind],Y[ind],bg=3,pch=21)
    lines(c(min(X[ind]),max(X[ind])),c(smooth[i],smooth[i]),col=2,lwd=2)
    lines(centers[1:i],smooth[1:i],col="black")
    points(centers[i],smooth[i],col="black",pch=16,cex=1.5)
  }
}

# Cross-validation


# Confounding
library(dagdata)
data(admissions)
admissions$total=admissions$Percent*admissions$Number/100
##percent men get in
sum(admissions$total[admissions$Gender==1]/sum(admissions$Number[admissions$Gender==1]))
sum(admissions$total[admissions$Gender==0]/sum(admissions$Number[admissions$Gender==0]))

index <- admissions$Gender == 1
men <- admissions[index, ]
women <- admissions[!index, ]
menYes <- sum( men$Number*men$Percent/100 ) 
menNo <- sum( men$Number*(1-men$Percent/100) ) 
womenYes  <- sum( women$Number*women$Percent/100 ) 
womenNo <- sum( women$Number*(1-women$Percent/100) )  
tab <- matrix( c(menYes, womenYes, menNo, womenNo), 2,2 )
tab
chisq.test( tab )$p.val

y <- cbind( admissions[1:6, c(1,3)], admissions[7:12, 3] ) 
colnames(y)[2:3] <- c("Male", "Female")
y



y=cbind(admissions[1:6,5],admissions[7:12,5])
y=sweep(y,2,colSums(y),"/")*100
x=rowMeans(cbind(admissions[1:6,3],admissions[7:12,3]))

library(rafalib)




# Adjusting for batch effects with linear models
library(GSE5859Subset)
data(GSE5859Subset)

library( rafalib )
library( genefilter )

batch <- factor( format(sampleInfo$date, "%m") )
batch

chr <- geneAnnotation$CHR
chr

tt <- rowttests( geneExpression, batch)
head( tt )

ind1 <- which( chr=="chrY" )
ind2 <- setdiff( c(order(tt$dm)[1:25], order(-tt$dm)[1:25]), ind1 ) 
ind2

set.seed(1)
ind0 <- setdiff( sample( seq(along=tt$dm), 50) , c(ind2, ind1) ) 
geneindex <- c(ind2, ind0, ind1)
mat <- geneExpression[ geneindex, ]
mat <- mat - rowMeans(mat)
icolors <- colorRampPalette( rev(brewer.pal(11, "RdYlBu") ) )(100) 
mypar(1,1)
image( t(mat), xaxt="n", yaxt="n", col=icolors)


# Exploratory data analysis for evaluation

mypar2(1,1)
plot(c(0,4),c(0,4),xlab="Dimension 1",ylab="Dimension 2",type="n")
arrows(0,0,2,3,lwd=3)
text(2,3," Y",pos=4,cex=3)

