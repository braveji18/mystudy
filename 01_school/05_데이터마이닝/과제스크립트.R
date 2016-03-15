
install.packages("cluster")
library(cluster)


ex4 <- read.table( "D:/work_R/Datamining_work/ex4.txt", header=T )

crime_rate <- as.matrix( ex4[ , -1] )

single <- hclust( dist(crime_rate, method="manhattan"), method="single" )
complete <- hclust( dist(crime_rate, method="manhattan"), method="complete" )
average <- hclust( dist(crime_rate, method="manhattan"), method="average" )
diana <- diana( crime_rate , metric="manhattan")

par(mfrow=c(2,3))
plot(single, main = "1970년 미국의 범죄비율-단일연결법" )
groups <- cutree(single, k=5)
rect.hclust(single, k=5, border="red")

plot(complete, main = "1970년 미국의 범죄비율-완전연결법" )
groups <- cutree(complete, k=5)
rect.hclust(complete, k=5, border="red")

plot(average, main = "1970년 미국의 범죄비율-평균연결법" )
groups <- cutree(average, k=5)
rect.hclust(average, k=5, border="red")

plot(diana, main = "1970년 미국의 범죄비율-DIANA" )
groups <- cutree(diana, k=5)
rect.hclust(diana, k=5, border="red")


