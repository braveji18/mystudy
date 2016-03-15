

##########################################
## Reading sequence data into R 

library("seqinr")
dengue <- read.fasta(file = "den1.fasta")
dengueseq <- dengue[[1]]

dengueseq[452:535]

GC(dengueseq)

GC(dengueseq[1:2000])

GC(dengueseq[2001:4000])

GC(dengueseq[4001:6000])

GC(dengueseq[6001:8000])

GC(dengueseq[8001:10000])

GC(dengueseq[10001:10735])


##########################################
## A sliding window plot of GC content
starts <- seq(1, length(dengueseq)-2000, by = 2000)
n <- length(starts)
chunkGCs <- numeric(n)
for (i in 1:n) {
  chunk <- dengueseq[starts[i]:(starts[i]+1999)]
  chunkGC <- GC(chunk)
  print(chunkGC)
  chunkGCs[i] <- chunkGC
}
plot(starts,chunkGCs,type="b",xlab="Nucleotide start position",ylab="GC content")


slidingwindowplot <- function(windowsize, inputseq) {
  starts <- seq(1, length(inputseq)-windowsize, by = windowsize)
  n <- length(starts) # Find the length of the vector "starts"
  chunkGCs <- numeric(n) # Make a vector of the same length as vector "starts", but just containing 
  for (i in 1:n) {
    chunk <- inputseq[starts[i]:(starts[i]+windowsize-1)]
    chunkGC <- GC(chunk)
    print(chunkGC)
    chunkGCs[i] <- chunkGC
  }
  plot(starts,chunkGCs,type="b",xlab="Nucleotide start position",ylab="GC content")
}

slidingwindowplot(3000, dengueseq)

slidingwindowplot(300, dengueseq)

##########################################
## Over-represented and under-represented DNA words
count(dengueseq, 1)

2770/(3426+2240+2770+2299) # Get fG

2240/(3426+2240+2770+2299) # Get fC

count(dengueseq, 2)

500/(1108+720+890+708+901+523+261+555+976+500+787+507+440+497+832+529) # Get fGC

0.04658096/(0.2580345*0.2086633) # Get rho(GC)
