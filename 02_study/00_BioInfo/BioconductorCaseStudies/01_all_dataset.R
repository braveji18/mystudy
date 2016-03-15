
##########################################
## The ALL data 와 Data subsetting

source("http://bioconductor.org/biocLite.R")
biocLite("ALL")
biocLite("genefilter")

library("Biobase")
library("ALL")
library("genefilter")
data("ALL")

bcell = grep("^B", as.character(ALL$BT))

types = c("NEG", "BCR/ABL")
moltyp = which(as.character(ALL$mol.biol) %in% types)

ALL_bcrneg = ALL[, intersect(bcell, moltyp)]

ALL_bcrneg$mol.biol = factor(ALL_bcrneg$mol.biol)
ALL_bcrneg$BT = factor(ALL_bcrneg$BT)

##########################################
## Nonspecific filtering

source("http://bioconductor.org/biocLite.R")
biocLite("hgu95av2.db")
library("hgu95av2.db")

varCut = 0.5
filt_bcrneg = nsFilter(ALL_bcrneg, require.entrez=TRUE,
                       require.GOBP=TRUE, remove.dupEntrez=TRUE,
                       var.func=IQR, var.cutoff=varCut,
                       feature.exclude="^AFFX")
filt_bcrneg$filter.log

ALLfilt_bcrneg = filt_bcrneg$eset

##########################################
## BCR/ABL ALL1/AF4 subset

types = c("ALL1/AF4", "BCR/ABL")
moltyp = which(ALL$mol.biol %in% types)
ALL_af4bcr = ALL[, intersect(bcell, moltyp)]
ALL_af4bcr$mol.biol = factor(ALL_af4bcr$mol.biol)
ALL_af4bcr$BT = factor(ALL_af4bcr$BT)
filt_af4bcr = nsFilter(ALL_af4bcr,require.entrez=TRUE,
                         require.GOBP=TRUE, remove.dupEntrez=TRUE,
                         var.func=IQR, var.cutoff=varCut)
ALLfilt_af4bcr = filt_af4bcr$eset


