

#install.packages('smfsb')

require(smfsb)
require(parallel)

options(mc.cores=8)
data(LVdata)

N=1e6
bs=1e4
batches=N/bs
message(paste("N =",N," | bs =",bs," | batches =",batches))

distance<-function(ts)
{
    diff=ts[,1]-LVprey
    sum(diff*diff)
}

post=NULL
for (i in 1:batches) {
    message(paste("batch",i,"of",batches))
    prior=cbind(th1=exp(runif(bs,-6,2)),th2=exp(runif(bs,-6,2)),th3=exp(runif(bs,-6,2)))
    rows=lapply(1:bs,function(i){prior[i,]})
    samples=mclapply(rows,function(th){simTs(c(50,100),0,30,2,stepLVc,th)})
    dist=mclapply(samples,distance)
    dist=sapply(dist,c)
    cutoff=quantile(dist,1000/N)
    post=rbind(post,prior[dist<cutoff,])
}
message(paste("Finished. Kept",dim(post)[1],"simulations"))

op=par(mfrow=c(2,3))
apply(post,2,hist,30)
apply(log(post),2,hist,30)
par(op)

