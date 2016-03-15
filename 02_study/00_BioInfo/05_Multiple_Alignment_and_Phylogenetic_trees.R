

##########################################
## Retrieving a list of sequences from UniProt

retrieveseqs <- function(seqnames,acnucdb)
{
  myseqs <- list() # Make a list to store the sequences
  require("seqinr") # This function requires the SeqinR R package
  choosebank(acnucdb)
  for (i in 1:length(seqnames))
  {
    seqname <- seqnames[i]
    print(paste("Retrieving sequence",seqname,"..."))
    queryname <- "query2"
    queryStr <- paste("AC=",seqname,sep="")
    query(queryname, queryStr )
    seq <- getSequence(query2$req[[1]]) # Makes a vector "seq" containing the sequence
    myseqs[[i]] <- seq
  }
  closebank()
  return(myseqs)
}

# rabies virus phosphoprotein, Mokola virus phosphoprotein, 
# Lagos bat virus phosphoprotein, Western Caucasian bat virus phosphoprotein
seqnames <- c("P06747", "P0C569", "O56773", "Q5VKP1")
seqs <- retrieveseqs(seqnames,"swissprot")
length(seqs)

seq1 <- seqs[[1]]
seq1[1:20]

seq2 <- seqs[[2]]
seq2[1:20]

write.fasta(seqs, seqnames, file="phosphoproteins.fasta")

##########################################
## Installing the CLUSTAL multiple alignment software

# http://www.clustal.org/download/current/
# clustalX로 multiple alignmen한 결과를 "phosphoproteins.phy로 저장


##########################################
## Reading a multiple alignment file into R

virusaln <- read.alignment(file = "phosphoproteins.phy", format = "phylip")

printMultipleAlignment <- function(alignment, chunksize=60)
{
  # this function requires the Biostrings package
  require("Biostrings")
  # find the number of sequences in the alignment
  numseqs <- alignment$nb
  # find the length of the alignment
  alignmentlen <- nchar(alignment$seq[[1]])
  starts <- seq(1, alignmentlen, by=chunksize)
  n <- length(starts)
  # get the alignment for each of the sequences:
  aln <- vector()
  lettersprinted <- vector()
  for (j in 1:numseqs)
  {
    alignmentj <- alignment$seq[[j]]
    aln[j] <- alignmentj
    lettersprinted[j] <- 0
  }
  # print out the alignment in blocks of ’chunksize’ columns:
  for (i in 1:n) { # for each of n chunks
    for (j in 1:numseqs)
    {
      alnj <- aln[j]
      chunkseqjaln <- substring(alnj, starts[i], starts[i]+chunksize-1)
      chunkseqjaln <- toupper(chunkseqjaln)
      # Find out how many gaps there are in chunkseqjaln:
      gapsj <- countPattern("-",chunkseqjaln) # countPattern() is from Biostrings package
      # Calculate how many residues of the first sequence we have printed so far in the alignment:
      lettersprinted[j] <- lettersprinted[j] + chunksize - gapsj
      print(paste(chunkseqjaln,lettersprinted[j]))
    }
    print(paste(" "))
  }
}

printMultipleAlignment(virusaln, 60)


##########################################
## Discarding very poorly conserved regions from an alignment

cleanAlignment <- function(alignment, minpcnongap, minpcid)
{
  # make a copy of the alignment to store the new alignment in:
  newalignment <- alignment
  # find the number of sequences in the alignment
  numseqs <- alignment$nb
  # empty the alignment in "newalignment")
  for (j in 1:numseqs) { newalignment$seq[[j]] <- "" }
  # find the length of the alignment
  alignmentlen <- nchar(alignment$seq[[1]])
  # look at each column of the alignment in turn:
  for (i in 1:alignmentlen)
  {
    # see what percent of the letters in this column are non-gaps:
    nongap <- 0
    for (j in 1:numseqs)
    {
      seqj <- alignment$seq[[j]]
      letterij <- substr(seqj,i,i)
      if (letterij != "-") { nongap <- nongap + 1}
    }
    pcnongap <- (nongap*100)/numseqs
    # Only consider this column if at least minpcnongap % of the letters are not gaps:
    if (pcnongap >= minpcnongap)
    {
      # see what percent of the pairs of letters in this column are identical:
      numpairs <- 0; numid <- 0
      # find the letters in all of the sequences in this column:
      for (j in 1:(numseqs-1))
      {
        seqj <- alignment$seq[[j]]
        letterij <- substr(seqj,i,i)
        for (k in (j+1):numseqs)
        {
          seqk <- alignment$seq[[k]]
          letterkj <- substr(seqk,i,i)
          if (letterij != "-" && letterkj != "-")
          {
            numpairs <- numpairs + 1
            if (letterij == letterkj) { numid <- numid + 1}
          }
        }
      }
      pcid <- (numid*100)/(numpairs)
      # Only consider this column if at least %minpcid of the pairs of letters are identical:
      if (pcid >= minpcid)
      {
        for (j in 1:numseqs)
        {
          seqj <- alignment$seq[[j]]
          letterij <- substr(seqj,i,i)
          newalignmentj <- newalignment$seq[[j]]
          newalignmentj <- paste(newalignmentj,letterij,sep="")
          newalignment$seq[[j]] <- newalignmentj
        }
      }
    }
  }
  return(newalignment)
}

cleanedvirusaln <- cleanAlignment(virusaln, 30, 30)

##########################################
## Calculating genetic distances between protein sequences

virusdist <- dist.alignment(virusaln) # Calculate the genetic distances
virusdist # Print out the genetic distance

##########################################
## Calculating genetic distances between DNA/mRNA sequences

seqnames <- c("AF049118", "AF049114", "AF049119", "AF049115") # Make a vector containing the names 
seqs <- retrieveseqs(seqnames,"genbank") # Retrieve the sequences and store
write.fasta(seqs, seqnames, file="virusmRNA.fasta")

# clustalX로 multiple alignmen한 결과를 virusmRNA.phy로 저장

virusmRNAaln <- read.alignment(file = "virusmRNA.phy", format = "phylip")
virusmRNAalnbin <- as.DNAbin(virusmRNAaln) # Convert the alignment to "DNAbin" format
virusmRNAdist <- dist.dna(virusmRNAalnbin) # Calculate the genetic distance matrix
virusmRNAdist # Print out the genetic distance matrix

##########################################
## Building an unrooted phylogenetic tree for protein sequences

unrootedNJtree <- function(alignment,type)
{
  # this function requires the ape and seqinR packages:
  require("ape")
  require("seqinr")
  # define a function for making a tree:
  makemytree <- function(alignmentmat)
  {
    alignment <- ape::as.alignment(alignmentmat)
    if (type == "protein")
    {
      mydist <- dist.alignment(alignment)
    }
    else if (type == "DNA")
    {
      alignmentbin <- as.DNAbin(alignment)
      mydist <- dist.dna(alignmentbin)
    }
    mytree <- nj(mydist)
    mytree <- makeLabel(mytree, space="") # get rid of spaces in tip names.
    return(mytree)
  }
  # infer a tree
  mymat <- as.matrix.alignment(alignment)
  mytree <- makemytree(mymat)
  # bootstrap the tree
  myboot <- boot.phylo(mytree, mymat, makemytree)
  # plot the tree:
  plot.phylo(mytree,type="u") # plot the unrooted phylogenetic tree
  nodelabels(myboot,cex=0.7) # plot the bootstrap values
  mytree$node.label <- myboot # make the bootstrap values be the node labels
  return(mytree)
}

virusalntree <- unrootedNJtree(virusaln, type="protein")
cleanedvirusalntree <- unrootedNJtree(cleanedvirusaln, type="protein")

##########################################
## Building a rooted phylogenetic tree for protein sequences

#seqnames <- c("Q10572", "E3M2K8","Q8WS01","E1FUV2", "A8NSK3" , "Q9VT99" )
seqnames <- c("Q10572", "E3M2K8","Q8WS01", "A8NSK3" , "Q9VT99"   )
seqs <- retrieveseqs(seqnames,"swissprot")
write.fasta(seqs, seqnames, file="fox1.fasta")

fox1aln <- read.alignment(file = "fox1.phy", format = "phylip")

rootedNJtree <- function(alignment, theoutgroup, type)
{
  # load the ape and seqinR packages:
  require("ape")
  require("seqinr")
  # define a function for making a tree:
  makemytree <- function(alignmentmat, outgroup="theoutgroup")
  {
    alignment <- ape::as.alignment(alignmentmat)
    if (type == "protein")
    {
      mydist <- dist.alignment(alignment)
    }
    else if (type == "DNA")
    {
      alignmentbin <- as.DNAbin(alignment)
      mydist <- dist.dna(alignmentbin)
    }
    mytree <- nj(mydist)
    mytree <- makeLabel(mytree, space="") # get rid of spaces in tip names.
    myrootedtree <- root(mytree, outgroup, r=TRUE)
    return(myrootedtree)
  }
  # infer a tree
  mymat <- as.matrix.alignment(alignment)
  myrootedtree <- makemytree(mymat, outgroup=theoutgroup)
  # bootstrap the tree
  myboot <- boot.phylo(myrootedtree, mymat, makemytree)
  # plot the tree:
  plot.phylo(myrootedtree, type="p") # plot the rooted phylogenetic tree
  nodelabels(myboot,cex=0.7) # plot the bootstrap values

  mytree$node.label <- myboot # make the bootstrap values be the node labels
  return(mytree)
}

fox1alntree <- rootedNJtree(fox1aln, "Q9VT99",type="protein")




