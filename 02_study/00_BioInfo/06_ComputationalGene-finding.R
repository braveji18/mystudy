

##########################################
## The genetic code

library(seqinr)
tablecode()

##########################################
## Finding start and stop codons in a DNA sequence

library("Biostrings")
s1 <- "aaaatgcagtaacccatgccc"
matchPattern("atg", s1) # Find all ATGs in the sequence s1

findPotentialStartsAndStops <- function(sequence)
{
  # Define a vector with the sequences of potential start and stop codons
  codons <- c("atg", "taa", "tag", "tga")
  # Find the number of occurrences of each type of potential start or stop codon
  for (i in 1:4)
  {
    codon <- codons[i]
    # Find all occurrences of codon "codon" in sequence "sequence"
    occurrences <- matchPattern(codon, sequence)
    # Find the start positions of all occurrences of "codon" in sequence "sequence"
    codonpositions <- attr(occurrences,"start")
    # Find the total number of potential start and stop codons in sequence "sequence"
    numoccurrences <- length(codonpositions)
    if (i == 1)
    {
      # Make a copy of vector "codonpositions" called "positions"
      positions <- codonpositions
      # Make a vector "types" containing "numoccurrences" copies of "codon"
      types <- rep(codon, numoccurrences)
    }
    else
    {
      # Add the vector "codonpositions" to the end of vector "positions":
      positions <- append(positions, codonpositions, after=length(positions))
      # Add the vector "rep(codon, numoccurrences)" to the end of vector "types":
      types <- append(types, rep(codon, numoccurrences), after=length(types))
    }
  }
  # Sort the vectors "positions" and "types" in order of position along the input sequence:
  indices <- order(positions)
  positions <- positions[indices]
  types <- types[indices]

  # Return a list variable including vectors "positions" and "types":
  mylist <- list(positions,types)
  return(mylist)
}

s2 <- "aaaatgcagtaacccatgccc"
findPotentialStartsAndStops(s2) # 에러 발생함.


dengueseq <- getncbiseq("NC_001477")
dengueseqstart <- dengueseq[1:500] # Take the first 500 nucleotides of the DEN-1 Dengue sequence
length(dengueseqstart) # Find the length of the "dengueseqstart" start vector

library("seqinr") # Load the SeqinR package
dengueseqstart # Print out the vector dengueseqstart

dengueseqstartstring <- c2s(dengueseqstart) # Convert the vector "dengueseqstart" to a string
dengueseqstartstring # Print out the variable string of characters
findPotentialStartsAndStops(dengueseqstartstring) # 에러 발생함


##########################################
# Finding open reading frames on the forward strand of a DNA sequence

substring(dengueseqstartstring,137,143)

plotPotentialStartsAndStops <- function(sequence)
{
  # Define a vector with the sequences of potential start and stop codons
  codons <- c("atg", "taa", "tag", "tga")
  # Find the number of occurrences of each type of potential start or stop codon
  for (i in 1:4)
  {
    codon <- codons[i]
    # Find all occurrences of codon "codon" in sequence "sequence"
    occurrences <- matchPattern(codon, sequence)
    # Find the start positions of all occurrences of "codon" in sequence "sequence"
    codonpositions <- attr(occurrences,"start")
    # Find the total number of potential start and stop codons in sequence "sequence"
    numoccurrences <- length(codonpositions)
    if (i == 1)
    {
      # Make a copy of vector "codonpositions" called "positions"
      positions <- codonpositions
      # Make a vector "types" containing "numoccurrences" copies of "codon"
      types <- rep(codon, numoccurrences)
    }
    else
    {
      # Add the vector "codonpositions" to the end of vector "positions":
      positions <- append(positions, codonpositions, after=length(positions))
      # Add the vector "rep(codon, numoccurrences)" to the end of vector "types":
      types <- append(types, rep(codon, numoccurrences), after=length(types))
    }
  }
  # Sort the vectors "positions" and "types" in order of position along the input sequence:
  indices <- order(positions)
  positions <- positions[indices]
  types <- types[indices]
  # Make a plot showing the positions of the start and stop codons in the input sequence:
  # Draw a line at y=0 from 1 to the length of the sequence:
  x <- c(1,nchar(sequence))
  y <- c(0,0)
  plot(x, y, ylim=c(0,3), type="l", axes=FALSE, xlab="Nucleotide", ylab="Reading frame",
       main="Predicted start (red) and stop (blue) codons")
  segments(1,1,nchar(sequence),1)
  segments(1,2,nchar(sequence),2)
  # Add the x-axis at y=0:
  axis(1, pos=0)
  # Add the y-axis labels:
  text(0.9,0.5,"+1")
  text(0.9,1.5,"+2")
  text(0.9,2.5,"+3")
  # Draw in each predicted start/stop codon:
  numcodons <- length(positions)
  for (i in 1:numcodons)
  {
    position <- positions[i]
    type <- types[i]
    remainder <- (position-1) %% 3
    if (remainder == 0) # +1 reading frame
    {
      if (type == "atg") { segments(position,0,position,1,lwd=1,col="red") }
      else { segments(position,0,position,1,lwd=1,col="blue")}
    }
    else if (remainder == 1)
    {
      if (type == "atg") { segments(position,1,position,2,lwd=1,col="red") }
      else { segments(position,1,position,2,lwd=1,col="blue")}
    }
    else if (remainder == 2)
    {
      if (type == "atg") { segments(position,2,position,3,lwd=1,col="red") }
      else { segments(position,2,position,3,lwd=1,col="blue")}
    }
  }
}

plotPotentialStartsAndStops(dengueseqstartstring)

s1 <- "aaaatgcagtaacccatgccc"





