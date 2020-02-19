#Dockerfile

FROM rstudio.docker.repository.cloudera.com/cdsw/engine:10

WORKDIR /tmp

ENV REPO_URL  https://cran.seoul.go.kr/

##################################################
## STEP 01
##################################################
RUN apt-get update && \
    R -e "install.packages('abind', repos='${REPO_URL}') " && \
    R -e "install.packages('acepack', repos='${REPO_URL}') " && \
    R -e "install.packages('adabag', repos='${REPO_URL}') " && \
    R -e "install.packages('ade4', repos='${REPO_URL}') " && \
    R -e "install.packages('ape', repos='${REPO_URL}') " && \
    R -e "install.packages('assertthat', repos='${REPO_URL}') " && \
    R -e "install.packages('backports', repos='${REPO_URL}') " && \
    R -e "install.packages('base64enc', repos='${REPO_URL}') " && \
    R -e "install.packages('BH', repos='${REPO_URL}') " && \
    R -e "install.packages('bindr', repos='${REPO_URL}') " && \
    R -e "install.packages('bindrcpp', repos='${REPO_URL}') " && \
    R -e "install.packages('bipartite', repos='${REPO_URL}') " && \
    R -e "install.packages('bit', repos='${REPO_URL}') " && \
    R -e "install.packages('bit64', repos='${REPO_URL}') " && \
    R -e "install.packages('bitops', repos='${REPO_URL}') " && \
    R -e "install.packages('blob', repos='${REPO_URL}') " && \
    R -e "install.packages('broom', repos='${REPO_URL}') " && \
    R -e "install.packages('callr', repos='${REPO_URL}') " && \
    R -e "install.packages('car', repos='${REPO_URL}') " && \
    R -e "install.packages('caret', repos='${REPO_URL}') " && \
    R -e "install.packages('caTools', repos='${REPO_URL}') " && \
    R -e "install.packages('cellranger', repos='${REPO_URL}') " && \
    R -e "install.packages('checkmate', repos='${REPO_URL}') " && \
    R -e "install.packages('cli', repos='${REPO_URL}') " && \
    R -e "install.packages('clipr', repos='${REPO_URL}') " && \
    R -e "install.packages('clue', repos='${REPO_URL}') " && \
    R -e "install.packages('ClusterR', repos='${REPO_URL}') " && \
    R -e "install.packages('clv', repos='${REPO_URL}') " && \
    R -e "install.packages('colorspace', repos='${REPO_URL}') " && \
    R -e "install.packages('corrplot', repos='${REPO_URL}') " && \
    R -e "install.packages('covr', repos='${REPO_URL}') " && \
    R -e "install.packages('crayon', repos='${REPO_URL}') " && \
    R -e "install.packages('curl', repos='${REPO_URL}') " && \
    R -e "install.packages('data.table', repos='${REPO_URL}') " && \
    R -e "install.packages('DBI', repos='${REPO_URL}') " && \
    R -e "install.packages('DBItest', repos='${REPO_URL}') "
   
##################################################
## STEP 02
##################################################   
RUN R -e "install.packages('dbplyr', repos='${REPO_URL}') " && \
    R -e "install.packages('DEoptimR', repos='${REPO_URL}') " && \
    R -e "install.packages('dichromat', repos='${REPO_URL}') " && \
    R -e "install.packages('digest', repos='${REPO_URL}') " && \
    R -e "install.packages('diptest', repos='${REPO_URL}') " && \
    R -e "install.packages('doBy', repos='${REPO_URL}') " && \
    R -e "install.packages('doMC', repos='${REPO_URL}') " && \
    R -e "install.packages('doParallel', repos='${REPO_URL}') " && \
    R -e "install.packages('doRNG', repos='${REPO_URL}') " && \
    R -e "install.packages('doSNOW', repos='${REPO_URL}') " && \
    R -e "install.packages('dplyr', repos='${REPO_URL}') " && \
    R -e "install.packages('dtw', repos='${REPO_URL}') " && \
    R -e "install.packages('dtwclust', repos='${REPO_URL}') " && \
    R -e "install.packages('e1071', repos='${REPO_URL}') " && \
    R -e "install.packages('elasticnet', repos='${REPO_URL}') " && \
    R -e "install.packages('evaluate', repos='${REPO_URL}') " && \
    R -e "install.packages('FD', repos='${REPO_URL}') " && \
    R -e "install.packages('fda', repos='${REPO_URL}') " && \
    R -e "install.packages('fdapace', repos='${REPO_URL}') " && \
    R -e "install.packages('fda.usc', repos='${REPO_URL}') " && \
    R -e "install.packages('fields', repos='${REPO_URL}') " && \
    R -e "install.packages('flashClust', repos='${REPO_URL}') " && \
    R -e "install.packages('flexclust', repos='${REPO_URL}') " && \
    R -e "install.packages('flexmix', repos='${REPO_URL}') " && \
    R -e "install.packages('forcats', repos='${REPO_URL}') " && \
    R -e "install.packages('foreach', repos='${REPO_URL}') " && \
    R -e "install.packages('forecast', repos='${REPO_URL}') " && \
    R -e "install.packages('Formula', repos='${REPO_URL}') " && \
    R -e "install.packages('fpc', repos='${REPO_URL}') " && \
    R -e "install.packages('fracdiff', repos='${REPO_URL}') " && \
    R -e "install.packages('futile.logger', repos='${REPO_URL}') " && \
    R -e "install.packages('futile.options', repos='${REPO_URL}') " && \
    R -e "install.packages('gbm', repos='${REPO_URL}') " && \
    R -e "install.packages('gdata', repos='${REPO_URL}') " && \
    R -e "install.packages('geometry', repos='${REPO_URL}') " && \
    R -e "install.packages('ggplot2', repos='${REPO_URL}') " && \
    R -e "install.packages('glmnet', repos='${REPO_URL}') " && \
    R -e "install.packages('glue', repos='${REPO_URL}') " && \
    R -e "install.packages('gmp', repos='${REPO_URL}') "

##################################################
## STEP 03
################################################## 
RUN R -e "install.packages('GPFDA', repos='${REPO_URL}') " && \
    R -e "install.packages('GPfit', repos='${REPO_URL}') " && \
    R -e "install.packages('gplots', repos='${REPO_URL}') " && \
    R -e "install.packages('gridBase', repos='${REPO_URL}') " && \
    R -e "install.packages('gridExtra', repos='${REPO_URL}') " && \
    R -e "install.packages('gtable', repos='${REPO_URL}') " && \
    R -e "install.packages('gtools', repos='${REPO_URL}') " && \
    R -e "install.packages('haven', repos='${REPO_URL}') " && \
    R -e "install.packages('highr', repos='${REPO_URL}') " && \
    R -e "install.packages('Hmisc', repos='${REPO_URL}') " && \
    R -e "install.packages('hms', repos='${REPO_URL}') " && \
    R -e "install.packages('htmlTable', repos='${REPO_URL}') " && \
    R -e "install.packages('htmltools', repos='${REPO_URL}') " && \
    R -e "install.packages('htmlwidgets', repos='${REPO_URL}') " && \
    R -e "install.packages('httpuv', repos='${REPO_URL}') " && \
    R -e "install.packages('httr', repos='${REPO_URL}') " && \
    R -e "install.packages('ifultools', repos='${REPO_URL}') " && \
    R -e "install.packages('igraph', repos='${REPO_URL}') " && \
    R -e "install.packages('implyr', repos='${REPO_URL}') " && \
    R -e "install.packages('imputeTS', repos='${REPO_URL}') " && \
    R -e "install.packages('inum', repos='${REPO_URL}') " && \
    R -e "install.packages('ipred', repos='${REPO_URL}') " && \
    R -e "install.packages('irlba', repos='${REPO_URL}') " && \
    R -e "install.packages('iterators', repos='${REPO_URL}') " && \
    R -e "install.packages('itertools', repos='${REPO_URL}') " && \
    R -e "install.packages('JavaGD', repos='${REPO_URL}') " && \
    R -e "install.packages('jpeg', repos='${REPO_URL}') " && \
    R -e "install.packages('jsonlite', repos='${REPO_URL}') " && \
    R -e "install.packages('kerasR', repos='${REPO_URL}') " && \
    R -e "install.packages('kernlab', repos='${REPO_URL}') " && \
    R -e "install.packages('kml', repos='${REPO_URL}') " && \
    R -e "install.packages('kml3d', repos='${REPO_URL}') " && \
    R -e "install.packages('knitr', repos='${REPO_URL}') " && \
    R -e "install.packages('kohonen', repos='${REPO_URL}') " && \
    R -e "install.packages('labeling', repos='${REPO_URL}') " && \
    R -e "install.packages('lambda.r', repos='${REPO_URL}') " && \
    R -e "install.packages('lars', repos='${REPO_URL}') " && \
    R -e "install.packages('latticeExtra', repos='${REPO_URL}') " && \
    R -e "install.packages('lava', repos='${REPO_URL}') " && \
    R -e "install.packages('lazyeval', repos='${REPO_URL}') " && \
    R -e "install.packages('lhs', repos='${REPO_URL}') " && \
    R -e "install.packages('libcoin', repos='${REPO_URL}') "

##################################################
## STEP 04
################################################## 
RUN R -e "install.packages('lme4', repos='${REPO_URL}') " && \
    R -e "install.packages('lmtest', repos='${REPO_URL}') " && \
    R -e "install.packages('locpol', repos='${REPO_URL}') " && \
    R -e "install.packages('longitudinalData', repos='${REPO_URL}') " && \
    R -e "install.packages('lubridate', repos='${REPO_URL}') " && \
    R -e "install.packages('magic', repos='${REPO_URL}') " && \
    R -e "install.packages('magrittr', repos='${REPO_URL}') " && \
    R -e "install.packages('maps', repos='${REPO_URL}') " && \
    R -e "install.packages('markdown', repos='${REPO_URL}') " && \
    R -e "install.packages('MASS', repos='${REPO_URL}') " && \
    R -e "install.packages('MatrixModels', repos='${REPO_URL}') " && \
    R -e "install.packages('mclust', repos='${REPO_URL}') " && \
    R -e "install.packages('mime', repos='${REPO_URL}') " && \
    R -e "install.packages('miniCRAN', repos='${REPO_URL}') " && \
    R -e "install.packages('minqa', repos='${REPO_URL}') " && \
    R -e "install.packages('misc3d', repos='${REPO_URL}') " && \
    R -e "install.packages('mlbench', repos='${REPO_URL}') " && \
    R -e "install.packages('mnormt', repos='${REPO_URL}') " && \
    R -e "install.packages('ModelMetrics', repos='${REPO_URL}') " && \
    R -e "install.packages('modelr', repos='${REPO_URL}') " && \
    R -e "install.packages('modeltools', repos='${REPO_URL}') " && \
    R -e "install.packages('munsell', repos='${REPO_URL}') " && \
    R -e "install.packages('mvtnorm', repos='${REPO_URL}') " && \
    R -e "install.packages('NbClust', repos='${REPO_URL}') " && \
    R -e "install.packages('ncvreg', repos='${REPO_URL}') " && \
    R -e "install.packages('network', repos='${REPO_URL}') " && \
    R -e "install.packages('NeuralNetTools', repos='${REPO_URL}') " && \
    R -e "install.packages('nloptr', repos='${REPO_URL}') " && \
    R -e "install.packages('NMF', repos='${REPO_URL}') " && \
    R -e "install.packages('nnet', repos='${REPO_URL}') " && \
    R -e "install.packages('numDeriv', repos='${REPO_URL}') " && \
    R -e "install.packages('odbc', repos='${REPO_URL}') " && \
    R -e "install.packages('OpenImageR', repos='${REPO_URL}') " && \
    R -e "install.packages('openssl', repos='${REPO_URL}') " && \
    R -e "install.packages('parallelDist', repos='${REPO_URL}') " && \
    R -e "install.packages('partykit', repos='${REPO_URL}') " && \
    R -e "install.packages('pbkrtest', repos='${REPO_URL}') " && \
    R -e "install.packages('pdc', repos='${REPO_URL}') " && \
    R -e "install.packages('permute', repos='${REPO_URL}') " && \
    R -e "install.packages('pillar', repos='${REPO_URL}') "
    
##################################################
## STEP 05
################################################## 
RUN R -e "install.packages('pkgconfig', repos='${REPO_URL}') " && \
    R -e "install.packages('pkgmaker', repos='${REPO_URL}') " && \
    R -e "install.packages('plogr', repos='${REPO_URL}') " && \
    R -e "install.packages('pls', repos='${REPO_URL}') " && \
    R -e "install.packages('plsRglm', repos='${REPO_URL}') " && \
    R -e "install.packages('plyr', repos='${REPO_URL}') " && \
    R -e "install.packages('png', repos='${REPO_URL}') " && \
    R -e "install.packages('prabclus', repos='${REPO_URL}') " && \
    R -e "install.packages('pracma', repos='${REPO_URL}') " && \
    R -e "install.packages('praise', repos='${REPO_URL}') " && \
    R -e "install.packages('prodlim', repos='${REPO_URL}') " && \
    R -e "install.packages('proxy', repos='${REPO_URL}') " && \
    R -e "install.packages('pryr', repos='${REPO_URL}') " && \
    R -e "install.packages('psych', repos='${REPO_URL}') " && \
    R -e "install.packages('purrr', repos='${REPO_URL}') " && \
    R -e "install.packages('qdapRegex', repos='${REPO_URL}') " && \
    R -e "install.packages('quadprog', repos='${REPO_URL}') " && \
    R -e "install.packages('quantmod', repos='${REPO_URL}') " && \
    R -e "install.packages('quantreg', repos='${REPO_URL}') " && \
    R -e "install.packages('R6', repos='${REPO_URL}') " && \
    R -e "install.packages('randomForest', repos='${REPO_URL}') " && \
    R -e "install.packages('RcmdrMisc', repos='${REPO_URL}') " && \
    R -e "install.packages('RColorBrewer', repos='${REPO_URL}') " && \
    R -e "install.packages('Rcpp', repos='${REPO_URL}') " && \
    R -e "install.packages('RcppArmadillo', repos='${REPO_URL}') " && \
    R -e "install.packages('RcppEigen', repos='${REPO_URL}') " && \
    R -e "install.packages('RcppParallel', repos='${REPO_URL}') " && \
    R -e "install.packages('readr', repos='${REPO_URL}') " && \
    R -e "install.packages('readxl', repos='${REPO_URL}') " && \
    R -e "install.packages('registry', repos='${REPO_URL}') " && \
    R -e "install.packages('relimp', repos='${REPO_URL}') " && \
    R -e "install.packages('rematch', repos='${REPO_URL}') " && \
    R -e "install.packages('reprex', repos='${REPO_URL}') " && \
    R -e "install.packages('reshape2', repos='${REPO_URL}') " && \
    R -e "install.packages('reticulate', repos='${REPO_URL}') " && \
    R -e "install.packages('rex', repos='${REPO_URL}') " && \
    R -e "install.packages('rgl', repos='${REPO_URL}') " && \
    R -e "install.packages('rJava', repos='${REPO_URL}') " && \
    R -e "install.packages('RJDBC', repos='${REPO_URL}') " && \
    R -e "install.packages('RJSONIO', repos='${REPO_URL}') " && \
    R -e "install.packages('rlang', repos='${REPO_URL}') " && \
    R -e "install.packages('rmarkdown', repos='${REPO_URL}') "

##################################################
## STEP 06
################################################## 
RUN R -e "install.packages('RMySQL', repos='${REPO_URL}') " && \
    R -e "install.packages('rngtools', repos='${REPO_URL}') " && \
    R -e "install.packages('robustbase', repos='${REPO_URL}') " && \
    R -e "install.packages('ROCR', repos='${REPO_URL}') " && \
    R -e "install.packages('RODBC', repos='${REPO_URL}') " && \
    R -e "install.packages('rowr', repos='${REPO_URL}') " && \
    R -e "install.packages('rpart', repos='${REPO_URL}') " && \
    R -e "install.packages('rprojroot', repos='${REPO_URL}') " && \
    R -e "install.packages('rstudioapi', repos='${REPO_URL}') " && \
    R -e "install.packages('rvest', repos='${REPO_URL}') " && \
    R -e "install.packages('sandwich', repos='${REPO_URL}') " && \
    R -e "install.packages('scales', repos='${REPO_URL}') " && \
    R -e "install.packages('scatterplot3d', repos='${REPO_URL}') " && \
    R -e "install.packages('selectr', repos='${REPO_URL}') " && \
    R -e "install.packages('shapes', repos='${REPO_URL}') " && \
    R -e "install.packages('shiny', repos='${REPO_URL}') " && \
    R -e "install.packages('sna', repos='${REPO_URL}') " && \
    R -e "install.packages('snow', repos='${REPO_URL}') " && \
    R -e "install.packages('som', repos='${REPO_URL}') " && \
    R -e "install.packages('sourcetools', repos='${REPO_URL}') " && \
    R -e "install.packages('spam', repos='${REPO_URL}') " && \
    R -e "install.packages('SparseM', repos='${REPO_URL}') " && \
    R -e "install.packages('splitstackshape', repos='${REPO_URL}') " && \
    R -e "install.packages('splus2R', repos='${REPO_URL}') " && \
    R -e "install.packages('statnet.common', repos='${REPO_URL}') " && \
    R -e "install.packages('stinepack', repos='${REPO_URL}') " && \
    R -e "install.packages('stringi', repos='${REPO_URL}') " && \
    R -e "install.packages('stringr', repos='${REPO_URL}') " && \
    R -e "install.packages('strucchange', repos='${REPO_URL}') " && \
    R -e "install.packages('testthat', repos='${REPO_URL}') "
    
##################################################
## STEP 07
################################################## 
RUN R -e "install.packages('tibble', repos='${REPO_URL}') " && \
    R -e "install.packages('tidyr', repos='${REPO_URL}') " && \
    R -e "install.packages('tidyselect', repos='${REPO_URL}') " && \
    R -e "install.packages('tidyverse', repos='${REPO_URL}') " && \
    R -e "install.packages('tiff', repos='${REPO_URL}') " && \
    R -e "install.packages('timeDate', repos='${REPO_URL}') " && \
    R -e "install.packages('trimcluster', repos='${REPO_URL}') " && \
    R -e "install.packages('TSclust', repos='${REPO_URL}') " && \
    R -e "install.packages('tseries', repos='${REPO_URL}') " && \
    R -e "install.packages('TTR', repos='${REPO_URL}') " && \
    R -e "install.packages('urca', repos='${REPO_URL}') " && \
    R -e "install.packages('utf8', repos='${REPO_URL}') " && \
    R -e "install.packages('vars', repos='${REPO_URL}') " && \
    R -e "install.packages('vegan', repos='${REPO_URL}') " && \
    R -e "install.packages('viridis', repos='${REPO_URL}') " && \
    R -e "install.packages('viridisLite', repos='${REPO_URL}') " && \
    R -e "install.packages('whisker', repos='${REPO_URL}') " && \
    R -e "install.packages('withr', repos='${REPO_URL}') " && \
    R -e "install.packages('wmtsa', repos='${REPO_URL}') " && \
    R -e "install.packages('XML', repos='${REPO_URL}') " && \
    R -e "install.packages('xml2', repos='${REPO_URL}') " && \
    R -e "install.packages('xtable', repos='${REPO_URL}') " && \
    R -e "install.packages('xts', repos='${REPO_URL}') " && \
    R -e "install.packages('yaml', repos='${REPO_URL}') " && \
    R -e "install.packages('YieldCurve', repos='${REPO_URL}') " && \
    R -e "install.packages('ykmeans', repos='${REPO_URL}') " && \
    R -e "install.packages('zoo', repos='${REPO_URL}') "
    

