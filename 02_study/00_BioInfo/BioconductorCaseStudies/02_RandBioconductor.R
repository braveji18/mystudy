

##########################################
## Working with packages

source("http://bioconductor.org/biocLite.R")
biocLite(c("graph", "xtable"))


##########################################
## The apply family of functions

library("hgu95av2.db")
hgu95av2MAP$"1001_at"


myPos = eapply(hgu95av2MAP, function(x) grep("^17p", x,
                                             value=TRUE))
myPos = unlist(myPos)
length(myPos)

f17p = function(x) grep("^17p", x, value=TRUE)
myPos2 = eapply(hgu95av2MAP, f17p)
myPos2 = unlist(myPos2)
identical(myPos, myPos2)

##########################################
## Structures for genomic data

Biobase package에서 ExpressionSet class 를 정의

ExpressionSet class의 구조
1 ) assayData:
2 ) metadata:
  (1) phenoData
  (2) featureData
  (3) annotation
3 ) experimentData:




