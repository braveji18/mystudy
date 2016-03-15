

##########################################
## Querying the NCBI Database via R

library("seqinr")

choosebank()

choosebank("genbank") # Specify that we want to search the ¡¯genbank¡¯ ACNUC sub-database
choosebank("refseq") # Specify that we want to search the ¡¯refseq¡¯ ACNUC sub-database
query("RefSeqBact", "SP=Bacteria")
closebank()


choosebank("genbank")
query("SchistosomamRNA", "SP=Schistosoma mansoni AND M=mrna")
closebank()


##########################################
## finding the sequence for the DEN-1 Dengue virus genome

choosebank("refseqViruses")
query("Dengue1", "AC=NC_001477")
attributes(Dengue1)

Dengue1$nelem

Dengue1$req

attr(Dengue1, "names")

attr(Dengue1, "class")

dengueseq <- getSequence(Dengue1$req[[1]])

dengueseq[1:50]

annots <- getAnnot(Dengue1$req[[1]])

annots[1:20]

closebank()

##########################################
## finding the sequences published in Nature 460:352-358

choosebank("genbank") # Specify that we want to search the ¡¯genbank¡¯ ACNUC sub-database

query( "naturepaper", "R=Nature/460/352" )  # error 

naturepaper$nelem

accessions <- naturepaper$req

accessions[1:5]

for (i in 1:5)
{
  seqi <- getSequence(naturepaper$req[[i]])
  print(seqi[1:10])
}
closebank()


##########################################
## Saving sequence data in a FASTA-format file

choosebank("genbank") # select the ACNUC sub-database to be searched

query("humtRNAs", "SP=homo sapiens AND M=TRNA") # specify the query

myseqs <- getSequence(humtRNAs) # get the sequences

myseqs

mynames <- getName(humtRNAs) # get the names of the sequences

mynames

write.fasta(myseqs, mynames, file.out="humantRNAs.fasta")

closebank()



