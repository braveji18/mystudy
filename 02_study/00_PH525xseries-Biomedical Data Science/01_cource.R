

########################################################
## 1: Statistics and R for the Life Sciences
########################################################

# installing packages
install.packages( "devtools" )

library(devtools)
install_github( "genomicsclass/dagdata" )


# Learn R basics
install.packages( "swirl" )
library( swirl )
swirl()


# Importing data into R
getwd()
setwd("D:/Work_R/R-Project/00_PH525xseries-Biomedical Data Science")

dat <- read.csv( "femaleMiceWeights.csv" )
head( dat )


# Reading directly from github
install.packages( "downloader" )
library( downloader )
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"

filename <- tempfile()
filename
download( url , destfile=filename )


dat <- read.csv( filename )
head( dat )


# Reading data stored in a package
dir <- system.file( package="dagdata" )
list.files( dir )
list.files( file.path(dir, "extdata") )
filename <- file.path( dir, "extdata/femaleMiceWeights.csv" )
filename
dat <- read.csv( filename )
head( dat )

summary( dat )

# Data summaries: summary, str
rats <- data.frame( id = paste0("rat", 1:10 )
                    , sex = factor( rep(c("female", "mail"), each=5) )
                    , weight = c( 2, 4, 1, 11, 18, 12, 7, 12, 19, 20 )
                    , length = c(100, 105, 115, 130, 95, 150, 165, 180, 190, 175) 
)
rats
summary( rats )

summary( rats$weight )
str( rats)

# Aligning two objects: match, merge
ratsTable <- data.frame( id=paste0( "rat", c(6, 9, 7, 3, 5, 1, 10, 4, 8, 2) )
                         , secretID = 1:10 )
ratsTable

cbind(rats, ratsTable)  # wrong!!

match( ratsTable$id, rats$id)

rats[ match( ratsTable$id, rats$id), ]

cbind( rats[ match( ratsTable$id, rats$id), ], ratsTable  ) 


ratsMerged <- merge(rats, ratsTable, by.x = "id", by.y = "id" )
ratsMerged [ order( ratsMerged$secretID ),   ]  


# Analysis over groups: split, tapply, and dplyr libary
sp <- split( rats$weight, rats$sex ) 
sp
lapply( sp, mean)
tapply( rats$weight, rats$sex, mean)

install.packages("dplyr")
library(dplyr)
sexes <- group_by(rats, sex)
sexes
summarise(sexes, ave=mean(weight) ) 

rats %>% group_by(sex) %>% summarise(ave = mean(weight))

## Installing software from github.com

library(devtools)
install_github('rafalib', 'ririzarr')
library(rafalib)
mypar

shist(rnorm(100))

## Introduction to random variables

dat=read.csv("femaleMiceWeights.csv")
dir <- system.file( package="dagdata" )
list.files(dir)
list.files( file.path(dir, "extdata") )
filename <- file.path(dir, "extdata/femalMiceWeights.csv" )
dat <- read.csv(filename)
dat

control <- dat[ 1:12, 2 ] 
control
treatment <- dat[ 13:24, 2]
treatment
mean( treatment ) 
mean( control ) 
diff <- mean(treatment) - mean(control)
diff

# Random variables
library( downloader )
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- "femaleControllsPopulation.csv"
if( !(file.exists(filename) ) )  download(url, destfile=filename)
population <- read.csv(filename)
population

control <- sample( population[,1] , 12 )
mean( control )


# Null distribution
control <- sample( population[,1], 12 ) 
treatment <- sample( population[,1], 12 ) 
mean(treatment) - mean(control)

n <- 10000
null <- vector("numeric", n)
for(i in 1:n ) {
  
  control <- sample( population[,1], 12 ) 
  treatment <- sample( population[,1], 12 ) 
  null[i] <-  mean(treatment) - mean(control)
  
}

mean( null>=diff )


## Illustration of the null distribution
n <- 100
plot(0, 0, xlim=c(-5,5), ylim=c(1,30), type="n")
totals <- vector("numeric", 11) 
for(i in 1:n) {
  
  control <- sample( population[,1], 12 ) 
  treatment <- sample( population[,1], 12 ) 
  nulldiff <-  mean(treatment) - mean(control)
  j <- pmax( pmin(round(nulldiff)+6, 11 ), 1)
  totals[j] <- totals[j] + 1
  text( j-6, totals[j], pch=15, round(nulldiff,1)  )
  
}


# Distributions
values <- seq( min(null), max(null), len=300  ) 
values
myecdf <- ecdf(null)
plot( values, myecdf(values), type="l" )

hist(null)
abline( v=diff )

1 - pnorm(diff, mean(null), sd(null)) 


# Population parameters

library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- tempfile()
download(url,destfile=filename)
dat <- read.csv(filename)

controlPopulation <- dat[ dat$Sex == "F" & dat$Diet == "chow", 3 ] 
length( controlPopulation )

hfPopulation <- dat[ dat$Sex == "F" & dat$Diet == "hf", 3 ] 
length( hfPopulation )

# Central Limit Theorem

1-pnorm(2)+pnorm(-2)


#The t-distribution

library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- "mice_pheno.csv"
if (!file.exists(filename)) download(url, destfile=filename)
dat <- read.csv(filename)
controlPopulation <- dat[dat$Sex=="F" & dat$Diet=="chow",3]
hfPopulation <- dat[dat$Sex=="F" & dat$Diet=="hf",3]

library(rafalib)

mypar2(1,2)
hist(hfPopulation)
hist(controlPopulation)


mypar2(1,2)
qqnorm(hfPopulation);qqline(hfPopulation)
qqnorm(controlPopulation);qqline(controlPopulation)


# Central Limit Theorem in practice
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- "mice_pheno.csv"
if (!file.exists(filename)) download(url, destfile=filename)
dat <- read.csv(filename)
head( dat )

hfPopulation <- dat[dat$Sex=="F" & dat$Diet=="hf",3]
controlPopulation <- dat[dat$Sex=="F" & dat$Diet=="chow",3]

mu_hf <- mean(hfPopulation)
mu_control <- mean(controlPopulation)
print(mu_hf - mu_control)

x <- controlPopulation
N <- length(x)
popvar <- mean( (x-mean(x))^2 )
identical( var(x), popvar ) 

identical( var(x)*(N-1)/N, popvar ) 

popvar <- function(x) mean( (x-mean(x))^2 )
popsd <- function(x) sqrt( popvar(x) ) 


sd_hf <- popsd( hfPopulation ) 
sd_control <- popsd( controlPopulation )

N <- 12
hf <- sample( hfPopulation, 12 )  
control <- sample( controlPopulation, 12 )  

Ns <- c( 3, 12, 25, 50 )
B <- 10000
res <- sapply( Ns, function(n) {
  
  replicate(B, 
            mean(sample(hfPopulation,n)) - 
            mean(sample(controlPopulation,n))
            ) 
  
})


library(rafalib)
mypar2(2,2)
for( i in seq(along=Ns) ) {
  title <- paste("N=",Ns[i],"Avg=",signif(mean(res[,i]),3),"SD=",signif(popsd(res[,i]),3))
  qqnorm( res[, i], main=title ) 
  qqline( res[, i], col=2 )
  
}



Ns <- c(3,12,25,50)
B <- 10000 #number of simulations
##function to compute a t-stat
computetstat <- function(n){
  y<-sample(hfPopulation,n)
  x<-sample(controlPopulation,n)
  (mean(y)-mean(x))/sqrt(var(y)/n+var(x)/n)
}
res <-  sapply(Ns,function(n){
  replicate(B,computetstat(n))
})
mypar2(2,2)
for(i in seq(along=Ns)){
  qqnorm(res[,i],main=Ns[i])
  qqline(res[,i],col=2)
}


# t-tests in practice
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if (!file.exists(filename)) download(url,filename)
dat <- read.csv(filename)
head(dat) ##quick look at the data 

controlIndex <- which(dat$Diet=="chow")
controlIndex
treatmentIndex <- which(dat$Diet=="hf")
treatmentIndex

control <- dat[ controlIndex, 2 ] 
treatment <- dat[ treatmentIndex, 2 ] 
diff <- mean(treatment) - mean(control)
diff

sd(control)/sqrt(length(control))
se <- sqrt( var(treatment)/length(treatment) + var(control)/length(control) )

tstat <- diff / se
tstat
righttail <- 1-pnorm(abs(tstat)) 
lefttail <- pnorm(-abs(tstat))
pval <- lefttail + righttail
print(pval)



t.test(treatment,control)

## Confidence interval 
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- "mice_pheno.csv"
if (!file.exists(filename)) download(url,destfile=filename)
dat <- read.csv(filename)
chowPopulation <- dat[dat$Sex=="F" & dat$Diet=="chow",3]
mu_chow <- mean( chowPopulation )
mu_chow


N <- 30
hf <- sample( chowPopulation, N )
se <- sd(hf) / sqrt(N)
se


# Association tests
tab <- matrix(  c(3, 1, 1, 3), 2,2 ) 
rownames(tab) <- c("Poured Before", "Poured After") 
colnames(tab) <- c("Guessed Before", "Guessed After") 
tab

fisher.test( tab, alternative="greater" )

# Chi-square test
disease=factor(c(rep(0,180),rep(1,20),rep(0,40),rep(1,10)),
               labels=c("control","cases"))
genotype=factor(c(rep("AA/Aa",200),rep("aa",50)),
                levels=c("AA/Aa","aa"))
genotype
dat <- data.frame(disease, genotype)
dat <- dat[sample(nrow(dat)),]##shuffle them up
head(dat)

table(genotype)
table(disease)

tab <- table(genotype,disease)
tab

odd_ratio <- (tab[2,2] / tab[2, 1]) /  (tab[1,2] / tab[1, 1])
odd_ratio

p <- mean( disease=="cases" )
p

expected <- rbind( c(1-p, p) * sum(genotype=="AA/Aa"),
                   c(1-p, p) * sum(genotype=="aa") )
dimnames(expected) <- dimnames(tab)
expected

chisq.test(tab)$p.value


tab <- tab * 10
chisq.test(tab)$p.value 

fit <- glm(disease~genotype, family="binomial", data=dat ) 
coeftab <- summary(fit)$coef
coeftab


# Power calculations
library(downloader)
url<-"https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- "mice_pheno.csv"
if (!file.exists(filename)) download(url,destfile=filename)
dat <- read.csv(filename)
hfPopulation <- dat[dat$Sex=="F" & dat$Diet=="hf",3]
controlPopulation <- dat[dat$Sex=="F" & dat$Diet=="chow",3]
mu_hf <- mean(hfPopulation)
mu_control <- mean(controlPopulation)
print(mu_hf - mu_control)

N <- 5
hf <- sample(hfPopulation, N)
control <- sample(controlPopulation, N)
t.test(hf, control)


N <- 12
alpha <- 0.05
B <- 2000

reject <- function(N, alpha=0.05) {
  hf <- sample( hfPopulation, N)
  control <- sample( controlPopulation, N)
  pval <- t.test( hf, control )$p.value
  pval < alpha
  
}

rejections <- replicate(B, reject(N))
mean( rejections)

Ns <- seq( 5, 50, 5)
power <- sapply(Ns, function(N) {
  rejections <- replicate(B, reject(N))
  mean(rejections)
} )

plot(Ns, power, type="b")




N <- 30
alphas <- c(0.1,0.05,0.01,0.001,0.0001)
power <- sapply(alphas,function(alpha){
  rejections <- replicate(B,reject(N,alpha=alpha))
  mean(rejections)
})
plot(log10(alphas), power, xlab="log (base 10) alpha", type="b")


## Monte Carlo Simulation

library(downloader)
url<-"https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- tempfile()
download(url,destfile="babies.txt")
dat <- read.table("babies.txt",header=TRUE)
smokers <- sample(dat$bwt[dat$smoke==1],10)
nonsmokers <- sample(dat$bwt[dat$smoke==0],10)
mean(smokers)-mean(nonsmokers)

for(i in 1:10) {
  smokers <- sample(dat$bwt[dat$smoke==1],10)
  nonsmokers <- sample(dat$bwt[dat$smoke==0],10)
  cat("observed difference = ",mean(smokers)-mean(nonsmokers),"ounces\n")
}


ttestgenerator <- function(n) {
  
  smokers <- sample( dat$bwt[ dat$smoke==1 ], n )
  nosmokers <- sample( dat$bwt[ dat$smoke==0 ], n )
  return ( 
    (mean(smokers)-mean(nosmokers)) / 
    sqrt(var(smokers)/n + var(nosmokers)/n)  
    ) 
}
ttests <- replicate(1000, ttestgenerator(10) )
hist( ttests )
qqnorm(ttests)
abline(0, 1)


ttests <- replicate(1000, ttestgenerator(3))
qqnorm(ttests)
abline(0,1)


# Permutation tests
dat <- read.table("babies.txt", header=TRUE)
set.seed(0)
N <- 50
smokers <- sample(dat$bwt[dat$smoke==1],N)
nonsmokers <- sample(dat$bwt[dat$smoke==0],N)
obs <- mean(smokers)-mean(nonsmokers)
obs

avgdiff <- replicate(1000, {
  all <- sample(c(smokers,nonsmokers))
  smokersstar <- all[1:N]
  nonsmokersstar <- all[(N+1):(2*N)]
  return(mean(smokersstar) - mean(nonsmokersstar))
})
hist(avgdiff)
abline(v=obs)

mean(abs(avgdiff) > abs(obs))


## Exploratory Data Analysis 1
install.packages("UsingR")
library(UsingR)
x=father.son$fheight
x

round(sample(x, 20), 1)
hist(x)
bins <- seq( floor(min(x)), ceiling(max(x)) ) 
hist( x, breaks=bins, xlab="Height", main="Adult men height")


myCDF <- ecdf(x)
xs <- seq( floor(min(x)), ceiling(max(x)), 0.1  ) 
plot( xs, myCDF(xs), type="l", xlab="x=Height", ylab="F(x)" )

mu <- mean(x)
popsd <- function(x) sqrt(mean((x-mean(x))^2)) 
popsd(x)
sd(x)

ps <- seq( 0.01, 0.99, 0.01)
qs <- quantile( x, ps )
qs
normalsqs <- qnorm(ps, mean(x), popsd(x))
normalsqs
plot( normalsqs, qs, xlab="Normal percentiles", ylab="Height percentiles" )
abline(0, 1)

qqnorm(x)
qqline(x)

dfs <- c(3,6,12,30)
mypar2(2,2)
for(df in dfs){
  x <- rt(1000,df)
  qqnorm(x,xlab="t quantiles",main=paste0("d.f=",df),ylim=c(-6,6))
  qqline(x)
}


# Boxplots
hist(exec.pay)

qqnorm(exec.pay)
qqline(exec.pay)


boxplot( exec.pay, ylab="1,000s of dollars", ylim=c(0, 400) )

## Exploratory Data Analysis 2
# install.packages("UsingR")
library(UsingR)

data("father.son")
x=father.son$fheight
y=father.son$sheight
plot(x, y, xlab="Father's height in inches", 
     ylab="Son's height in inches",
     main=paste("correlation=", signif(cor(x,y), 2))
     )

groups <- split( y, round(x) )
boxplot(groups)
print(  mean(y[ round(x)==72])  )



a=rnorm(100);a[1]=10
b=rnorm(100);b[1]=11
plot(a,b,main=paste("correlation =",signif(cor(a,b),2)))


## Plots to avoid
library("downloader")
filename <- "fig1.RData"
url <- "https://github.com/kbroman/Talk_Graphs/raw/master/R/fig1.RData"
if (!file.exists(filename)) download(url,filename)
load(filename)
library(rafalib)
mypar2(1,1)
dat <- list(Treatment=x,Control=y)
boxplot(dat,xlab="Group",ylab="Response",xlab="Group",ylab="Response",cex=0)
stripchart(dat,vertical=TRUE,method="jitter",pch=16,add=TRUE,col=1)


library(downloader)
url <- "https://github.com/kbroman/Talk_Graphs/raw/master/R/fig3.RData"
filename <- "fig3.RData"
if (!file.exists(filename)) download(url, filename)
load(filename)
library(rafalib)
mypar2(1,2)
dat <- list(Treatment=x,Control=y)
boxplot(dat,xlab="Group",ylab="Response",xlab="Group",ylab="Response",cex=0)
stripchart(dat,vertical=TRUE,method="jitter",pch=16,add=TRUE,col=1)
boxplot(dat,xlab="Group",ylab="Response",xlab="Group",ylab="Response",log="y",cex=0)
stripchart(dat,vertical=TRUE,method="jitter",pch=16,add=TRUE,col=1)


url <- "https://github.com/kbroman/Talk_Graphs/raw/master/R/fig4.RData"
filename <- "fig4.RData"
if (!file.exists(filename)) download(url, filename)
load(filename)
plot(x,y,lwd=2,type="n")
fit <- lm(y~x)
abline(fit$coef,lwd=2)
b <- round(fit$coef,4)
text(78, 200, paste("y =", b[1], "+", b[2], "x"), adj=c(0,0.5))
rho <- round(cor(x,y),4) # 0.8567
text(78, 187,expression(paste(rho," = 0.8567")),adj=c(0,0.5))


plot(x,y,lwd=2)
fit <- lm(y~x)
abline(fit$coef,lwd=2)


source("http://bioconductor.org/biocLite.R")
biocLite("Biobase")
biocLite("SpikeInSubset")


library(Biobase)
library(SpikeInSubset)
data(mas95)
mypar2(1,2)
r <- exprs(mas95)[,1] ##original measures were not logged
g <- exprs(mas95)[,2]
plot(r,g,lwd=2,cex=0.2,pch=16,
     xlab=expression(paste(E[1])),
     ylab=expression(paste(E[2])), 
     main=paste0("corr=",signif(cor(r,g),3)))
abline(0,1,col=2,lwd=2)
f <- function(a,x,y,p=0.95) mean(x<=a & y<=a)-p
a95 <- uniroot(f,lower=2000,upper=20000,x=r,y=g)$root
abline(a95,-1,lwd=2,col=1)
text(8500,0,"95% of data below this line",col=1,cex=1.2,adj=c(0,0))
r <- log2(r)
g <- log2(g)
plot(r,g,lwd=2,cex=0.2,pch=16,
     xlab=expression(paste(log[2], " ", E[1])),
     ylab=expression(paste(log[2], " ", E[2])),
     main=paste0("corr=",signif(cor(r,g),3)))
abline(0,1,col=2,lwd=2)


mypar2(1,1)
plot((r+g)/2,(r-g),lwd=2,cex=0.2,pch=16,
     xlab=expression(paste("Ave{ ",log[2], " ", E[1],", ",log[2], " ", E[2]," }")),
     ylab=expression(paste(log[2]," { ",E[1]," / ",E[2]," }")),
     main=paste0("SD=",signif(sqrt(mean((r-g)^2)),3)))
abline(h=0,col=2,lwd=2)


# Barpots for paired data
set.seed(12201970)
before <- runif(6, 5, 8)
after <- rnorm(6, before*1.05, 2)
li <- range(c(before, after))
ymx <- max(abs(after-before))

mypar2(1,2)
plot(before, after, xlab="Before", ylab="After",
     ylim=li, xlim=li)
abline(0,1, lty=2, col=1)


plot(before, after-before, xlab="Before", ylim=c(-ymx, ymx),
     ylab="Change (After - Before)", lwd=2)
abline(h=0, lty=2, col=1)


z <- rep(c(0,1), rep(6,2))
mypar2(1,2)
plot(z, c(before, after),
     xaxt="n", ylab="Response",
     xlab="", xlim=c(-0.5, 1.5))
axis(side=1, at=c(0,1), c("Before","After"))
segments(rep(0,6), before, rep(1,6), after, col=1)     

boxplot(before,after,names=c("Before","After"),ylab="Response")


mypar2(1,1)
library(downloader)
filename <- "fig8dat.csv"
url <- "https://github.com/kbroman/Talk_Graphs/raw/master/R/fig8dat.csv"
if (!file.exists(filename)) download(url, filename)
x <- read.table(filename, sep=",", header=TRUE)
plot(x[,1],x[,2],xlab="log Dose",ylab="Proportion survived",ylim=c(0,1),
     type="l",lwd=2,col=1)
lines(x[,1],x[,3],lwd=2,col=2)
lines(x[,1],x[,4],lwd=2,col=3)
legend(1,0.4,c("Drug A","Drug B","Drug C"),lwd=2, col=1:3)



plot(x, y1, ylim=c(0,1), type="n", xlab="Dose", ylab="Response") 
for(i in 1:3) lines(x, z[,i], col=1, lwd=1, lty=2)
for(i in 1:3) lines(x, y[,i], col=2, lwd=1, lty=2)
lines(x, ym, col=1, lwd=2)
lines(x, zm, col=2, lwd=2)
legend("bottomleft", lwd=2, col=c(1, 2), c("Control", "Treated"))


## dplyr tutorial
install.packages("dplyr")
library(dplyr)


library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- "msleep_ggplot2.csv"
if (!file.exists(filename)) download(url,filename)
msleep <- read.csv("msleep_ggplot2.csv")
head(msleep)

sleepData <- select(msleep, name, sleep_total)
head(sleepData)

head(select(msleep, -name))
head(select(msleep, name:order))
head(select(msleep, starts_with("sl")))
filter(msleep, sleep_total >= 16)
filter(msleep, sleep_total >= 16, bodywt >= 1)
filter(msleep, order %in% c("Perissodactyla", "Primates"))
head(select(msleep, name, sleep_total))
msleep %>% 
  select(name, sleep_total) %>% 
  head

msleep %>% arrange(order) %>% head

msleep %>% 
  select(name, order, sleep_total) %>%
  arrange(order, sleep_total) %>% 
  head


msleep %>% 
  mutate(rem_proportion = sleep_rem / sleep_total) %>%
  head


msleep %>% 
  mutate(rem_proportion = sleep_rem / sleep_total, 
         bodywt_grams = bodywt * 1000) %>%
  head


msleep %>% 
  summarise(avg_sleep = mean(sleep_total))

msleep %>% 
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total),
            max_sleep = max(sleep_total),
            total = n())


msleep %>% 
  group_by(order) %>%
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total), 
            max_sleep = max(sleep_total),
            total = n())


## Robust summaries and log transformation
set.seed(1)
x=c(rnorm(100,0,1)) ##real distribution
x[23] <- 100 ##mistake made in 23th measurement
boxplot(x)

mean(x)

sd(x)

median(x)

mad(x)

# Spearman correlation
set.seed(1)
x <- c( rnorm(100, 0, 1) ) 
x[23] <- 100
y <- c( rnorm(100, 0, 1))
y[23] <- 84

library( rafalib )
mypar(1,1)
plot( x, y, 
      main=paste0("correcation=", round( cor(x,y), 3 )),
      pch=21,
      bg=1,
      xlim=c(-3, 100),
      ylib=c(-3, 10)      
      )
abline(0, 1)

plot( rank(x), rank(y),
      main=paste0("correcation=", round( cor(x,y, method="spearman"),3)),
      pch=21,
      bg=1,
      xlim=c(-3, 100),ylim=c(-3, 100)
      )
abline(0 ,1)



hist(ratios)

x <- 2^(-5:5) ##this 1/32,1/16,1/8,...,1,2,...,32
mypar2(1,2)
plot(x)
abline(h=1)
plot(log2(x))
abline(h=0)

help(package="genefilter")


n <- 10000
p <- 0.001
mu <- n * p
var <- n * p * ( 1-p)
cnt <- n * 0.05
dnorm(  cnt , mu, sqrt(var), log = FALSE)



###################################
Z <- stats::rnorm(1000)
#cut(Z, breaks = -6:6)

table(cut(Z, breaks = -6:6))
sum(table(cut(Z, breaks = -6:6, labels = FALSE)))
sum(graphics::hist(Z, breaks = -6:6, plot = FALSE)$counts)

cut(rep(1,5), 4) #-- dummy
tx0 <- c(9, 4, 6, 5, 3, 10, 5, 3, 5)
x <- rep(0:8, tx0)
stopifnot(table(x) == tx0)

table( cut(x, b = 8))
table( cut(x, breaks = 3*(-2:5)))
table( cut(x, breaks = 3*(-2:5), right = FALSE))

##--- some values OUTSIDE the breaks :
table(cx  <- cut(x, breaks = 2*(0:4)))
table(cxl <- cut(x, breaks = 2*(0:4), right = FALSE))
which(is.na(cx));  x[is.na(cx)]  #-- the first 9  values  0
which(is.na(cxl)); x[is.na(cxl)] #-- the last  5  values  8


## Label construction:
y <- stats::rnorm(100)
table(cut(y, breaks = pi/3*(-3:3)))
table(cut(y, breaks = pi/3*(-3:3), dig.lab = 4))

table(cut(y, breaks =  1*(-3:3), dig.lab = 4))
# extra digits don't "harm" here
table(cut(y, breaks =  1*(-3:3), right = FALSE))
#- the same, since no exact INT!

## sometimes the default dig.lab is not enough to be avoid confusion:
aaa <- c(1,2,3,4,5,2,3,4,5,6,7)
cut(aaa, 3)
cut(aaa, 3, dig.lab = 4, ordered = TRUE)

## one way to extract the breakpoints
labs <- levels(cut(aaa, 3))
cbind(lower = as.numeric( sub("\\((.+),.*", "\\1", labs) ),
      upper = as.numeric( sub("[^,]*,([^]]*)\\]", "\\1", labs) ))

