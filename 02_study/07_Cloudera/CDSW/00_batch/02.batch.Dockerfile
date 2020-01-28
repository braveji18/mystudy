# 운영 배치용 docker 이미지
FROM batch.shinhanai.com/ubuntu.base:1

ENV REPO_URL  https://cran.seoul.go.kr/

RUN R -e "install.packages('abind', repos='${REPO_URL}') " && \
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
    R -e "install.packages('DBItest', repos='${REPO_URL}') " && \
    R -e "install.packages('dbplyr', repos='${REPO_URL}') " && \
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
    R -e "install.packages('gmp', repos='${REPO_URL}') " && \
    R -e "install.packages('GPFDA', repos='${REPO_URL}') " && \
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
    R -e "install.packages('libcoin', repos='${REPO_URL}') " && \
    R -e "install.packages('lme4', repos='${REPO_URL}') " && \
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
    R -e "install.packages('pillar', repos='${REPO_URL}') " && \
    R -e "install.packages('pkgconfig', repos='${REPO_URL}') " && \
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
    R -e "install.packages('rmarkdown', repos='${REPO_URL}') " && \
    R -e "install.packages('RMySQL', repos='${REPO_URL}') " && \
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
    R -e "install.packages('testthat', repos='${REPO_URL}') " && \
    R -e "install.packages('tibble', repos='${REPO_URL}') " && \
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
    R -e "install.packages('zoo', repos='${REPO_URL}') " && \
    R -e "install.packages('base', repos='${REPO_URL}') " && \
    R -e "install.packages('boot', repos='${REPO_URL}') " && \
    R -e "install.packages('class', repos='${REPO_URL}') " && \
    R -e "install.packages('cluster', repos='${REPO_URL}') " && \
    R -e "install.packages('codetools', repos='${REPO_URL}') " && \
    R -e "install.packages('compiler', repos='${REPO_URL}') " && \
    R -e "install.packages('datasets', repos='${REPO_URL}') " && \
    R -e "install.packages('foreign', repos='${REPO_URL}') " && \
    R -e "install.packages('graphics', repos='${REPO_URL}') " && \
    R -e "install.packages('grDevices', repos='${REPO_URL}') " && \
    R -e "install.packages('grid', repos='${REPO_URL}') " && \
    R -e "install.packages('KernSmooth', repos='${REPO_URL}') " && \
    R -e "install.packages('lattice', repos='${REPO_URL}') " && \
    R -e "install.packages('MASS', repos='${REPO_URL}') " && \
    R -e "install.packages('Matrix', repos='${REPO_URL}') " && \
    R -e "install.packages('methods', repos='${REPO_URL}') " && \
    R -e "install.packages('mgcv', repos='${REPO_URL}') " && \
    R -e "install.packages('nlme', repos='${REPO_URL}') " && \
    R -e "install.packages('nnet', repos='${REPO_URL}') " && \
    R -e "install.packages('parallel', repos='${REPO_URL}') " && \
    R -e "install.packages('rpart', repos='${REPO_URL}') " && \
    R -e "install.packages('spatial', repos='${REPO_URL}') " && \
    R -e "install.packages('splines', repos='${REPO_URL}') " && \
    R -e "install.packages('stats', repos='${REPO_URL}') " && \
    R -e "install.packages('stats4', repos='${REPO_URL}') " && \
    R -e "install.packages('survival', repos='${REPO_URL}') " && \
    R -e "install.packages('tcltk', repos='${REPO_URL}') " && \
    R -e "install.packages('tools', repos='${REPO_URL}') " && \
    R -e "install.packages('utils', repos='${REPO_URL}') "

ENV CONDA_PATH  /opt/conda 

RUN ${CONDA_PATH}/bin/conda install -y  -n base  \
           alabaster==0.7.10   \
           absl-py==0.2.2  \
           asn1crypto==0.24.0   \
           astor==0.6.2  \
           astroid==1.6.3  \
           astropy==3.0.2  \
           attrs==18.1.0   \
           babel==2.5.3  \
           backcall==0.1.0  \
           backports==1.0  \
           backports.shutil_get_terminal_size==1.0.0   \
           beautifulsoup4==4.6.0  \
           bitarray==0.8.1  \
           bkcharts==0.2  \
           blas==1.0  \
           blaze==0.11.3   \
           bleach==2.1.3  \
           blosc==1.14.3   \
           bokeh==0.12.16  \
           boto==2.48.0   \
           boto3   \
           botocore   \
           bottleneck==1.2.1  \
           bz2file==0.98   \
           bzip2==1.0.6  \
		   && ${CONDA_PATH}/bin/conda clean -ay \
           && find /opt/conda/ -follow -type f -name '*.a' -delete \
           && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
           && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
           && find /opt/conda/lib/python*/site-packages/bokeh/server/static -follow -type f -name '*.js' ! -name '*.min.js' -delete
		   
		   
#RUN ${CONDA_PATH}/bin/conda install -y  -n base ca-certificates==2018.03.07   
#RUN ${CONDA_PATH}/bin/conda install -y  -n base -c conda-forge  cairo==1.14.12  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base -c conda-forge certifi==2018.4.16  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base cffi==1.11.5   
#RUN ${CONDA_PATH}/bin/conda install -y  -n base chardet==3.0.4  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base click==6.7  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base cloudpickle==0.5.3  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base clyent==1.2.2  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base colorama==0.3.9  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base contextlib2==0.5.5  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base cryptography==2.2.2  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base curl==7.60.0   
#RUN ${CONDA_PATH}/bin/conda install -y  -n base cycler==0.10.0   
#RUN ${CONDA_PATH}/bin/conda install -y  -n base cython==0.28.2   
#RUN ${CONDA_PATH}/bin/conda install -y  -n base cytoolz==0.9.0.1  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base dask==0.17.5   
#RUN ${CONDA_PATH}/bin/conda install -y  -n base dask-core==0.17.5   
#RUN ${CONDA_PATH}/bin/conda install -y  -n base datashape==0.5.4  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base dbus==1.13.2   
#RUN ${CONDA_PATH}/bin/conda install -y  -n base decorator==4.3.0  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base distributed==1.21.8   
#RUN ${CONDA_PATH}/bin/conda install -y  -n base docutils==0.14   
#RUN ${CONDA_PATH}/bin/conda install -y  -n base entrypoints==0.2.3  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base et_xmlfile==1.0.1  
#RUN ${CONDA_PATH}/bin/conda install -y  -n base expat==2.2.5  
		   
RUN ${CONDA_PATH}/bin/conda update -n base conda && \
    ${CONDA_PATH}/bin/conda install -y  -n base -c conda-forge   \
           ca-certificates==2018.03.07   \
           cairo==1.14.12  \
           certifi==2018.4.16  \
           cffi==1.11.5   \
           chardet==3.0.4  \
           click==6.7  \
           cloudpickle==0.5.3  \
           clyent==1.2.2  \
           colorama==0.3.9  \
           contextlib2==0.5.5  \
           cryptography==2.2.2  \
           curl==7.60.0   \
           cycler==0.10.0   \
           cython==0.28.2   \
           cytoolz==0.9.0.1  \
           dask==0.17.5   \
           dask-core==0.17.5   \
           datashape==0.5.4  \
           dbus==1.13.2   \
           decorator==4.3.0  \
           distributed==1.21.8   \
           docutils==0.14   \
           entrypoints==0.2.3  \
           et_xmlfile==1.0.1  \
           expat==2.2.5  \
		   && ${CONDA_PATH}/bin/conda clean -ay \
           && find /opt/conda/ -follow -type f -name '*.a' -delete \
           && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
           && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
           && find /opt/conda/lib/python*/site-packages/bokeh/server/static -follow -type f -name '*.js' ! -name '*.min.js' -delete		   
		   
RUN ${CONDA_PATH}/bin/conda install -y  -n base  \
           fastcache==1.0.2  \
           filelock==3.0.4  \
           flask==1.0.2  \
           flask-cors==3.0.4  \
           fontconfig==2.12.6   \
           freetype==2.8  \
           gast==0.2.0  \
           gensim>=3.5.0  \
           get_terminal_size==1.0.0  \
           gevent==1.3.0  \
           glib==2.56.1   \
           glob2==0.6  \
           gmp==6.1.2  \
           gmpy2==2.0.8  \
           graphite2==1.3.11   \
           greenlet==0.4.13   \
           grpcio==1.12.1   \
           gst-plugins-base==1.14.0   \
           gstreamer==1.14.0   \
           h5py==2.7.1  \
           harfbuzz==1.7.6  \
           hdf5==1.10.2   \
           heapdict==1.0.0  \
           html5lib==1.0.1  \
           icu==58.2   \
           idna==2.6  \
           imageio==2.3.0  \
           imagesize==1.0.0  \
           intel-openmp==2018.0.0   \
           ipykernel==4.8.2  \
           ipython==6.4.0  \
           ipython_genutils==0.2.0  \
           ipywidgets==7.2.1  \
           isort==4.3.4  \
           itsdangerous==0.24   \
		   && ${CONDA_PATH}/bin/conda clean -ay \
           && find /opt/conda/ -follow -type f -name '*.a' -delete \
           && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
           && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
           && find /opt/conda/lib/python*/site-packages/bokeh/server/static -follow -type f -name '*.js' ! -name '*.min.js' -delete
		   
RUN ${CONDA_PATH}/bin/conda install -y  -n base  \
           jbig==2.1  \
           jdcal==1.4  \
           jedi==0.12.0   \
           jinja2==2.10   \
           jmespath==0.9.3  \
           joblib==0.12.3   \
           jpeg==9b   \
           jsonschema==2.6.0  \
           jupyter==1.0.0  \
           jupyter_client==5.2.3  \
           jupyter_console==5.2.0  \
           jupyter_core==4.4.0  \
           jupyterlab==0.32.1   \
           jupyterlab_launcher==0.10.5   \
           kiwisolver==1.0.1  \
           lazy-object-proxy==1.3.1  \
           libcurl==7.60.0   \
           libedit==3.1.20170329   \
           libffi==3.2.1  \
           libgcc-ng==7.2.0  \
           libgfortran-ng==7.2.0  \
           libpng==1.6.34   \
           libsodium==1.0.16   \
           libssh2==1.8.0  \
           libstdcxx-ng==7.2.0  \
           libtiff==4.0.9  \
           libtool==2.4.6  \
           libxcb==1.13   \
           libxml2==2.9.8  \
           libxslt==1.1.32   \
           llvmlite==0.23.1   \
           locket==0.2.0  \
           lxml==4.2.1  \
           lzo==2.10   \
           Markdown==2.6.11   \
           markupsafe==1.0  \
           matplotlib==2.2.2  \
           mccabe==0.6.1  \
           mistune==0.8.3  \
           mkl==2018.0.2   \
           mkl-service==1.1.2  \
           mkl_fft==1.0.1  \
           mkl_random==1.0.1  \
           more-itertools==4.1.0  \
           mpc==1.0.3  \
           mpfr==3.1.5  \
           mpmath==1.0.0  \
           msgpack-python==0.5.6  \
           multipledispatch==0.5.0  \
		   && ${CONDA_PATH}/bin/conda clean -ay \
           && find /opt/conda/ -follow -type f -name '*.a' -delete \
           && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
           && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
           && find /opt/conda/lib/python*/site-packages/bokeh/server/static -follow -type f -name '*.js' ! -name '*.min.js' -delete
		   
RUN ${CONDA_PATH}/bin/conda install -y  -n base  \		   
           navigator-updater==0.2.1  \
           nbconvert==5.3.1  \
           nbformat==4.4.0  \
           ncurses==6.1  \
           networkx==2.1  \
           nltk==3.3.0  \
           nose==1.3.7  \
           notebook==5.5.0  \
           numba==0.38.0   \
           numexpr==2.6.5  \
           numpy==1.14.4   \
           numpy-base>=1.14.3   \
           numpydoc==0.8.0  \
           odo==0.5.1  \
           olefile==0.45.1   \
           openpyxl==2.5.3  \
           openssl==1.0.2o   \
           packaging==17.1   \
           pandas==0.23.0   \
           pandoc==1.19.2.1   \
           pandocfilters==1.4.2  \
           pango==1.41.0   \
           parso==0.2.0  \
           partd==0.3.8  \
           patchelf==0.9  \
           path.py==11.0.1   \
           pathlib2==2.3.2  \
           patsy==0.5.0  \
           pcre==8.42   \
           pep8==1.7.1  \
           pexpect==4.5.0  \
           pickleshare==0.7.4  \
           pillow==5.1.0  \
           pip==10.0.1   \
           pixman==0.34.0   \
           pkginfo==1.4.2  \
           pluggy==0.6.0  \
           ply==3.11   \
           progressbar2==3.37.1   \
           prompt_toolkit==1.0.15   \
           protobuf>=3.5.2.post1  \
           psutil==5.4.5  \
           ptyprocess==0.5.2  \
           py==1.5.3  \
           pycodestyle==2.4.0  \
           pycosat==0.6.3  \
           pycparser==2.18   \
           pycrypto==2.6.1  \
           pycurl==7.43.0.1   \
           pyflakes==1.6.0  \
           pygments==2.2.0  \
           pylint==1.8.4  \
           pyodbc==4.0.23   \
           pyopenssl==18.0.0   \
           pyparsing==2.2.0  \
           pyqt==5.9.2  \
           pysocks==1.6.8  \
           pytables==3.4.3  \
           pytest==3.5.1  \
           pytest-arraydiff==0.2  \
           pytest-astropy==0.3.0  \
           pytest-doctestplus==0.1.3  \
           pytest-openfiles==0.3.0  \
           pytest-remotedata==0.2.1  \
           python==3.6.5  \
           python-dateutil==2.7.3  \
           python-utils==2.3.0  \
           pytz==2018.4   \
           pywavelets==0.5.2  \
           pyyaml==3.12   \
           pyzmq==17.0.0   \
		   && ${CONDA_PATH}/bin/conda clean -ay \
           && find /opt/conda/ -follow -type f -name '*.a' -delete \
           && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
           && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
           && find /opt/conda/lib/python*/site-packages/bokeh/server/static -follow -type f -name '*.js' ! -name '*.min.js' -delete
		   
RUN ${CONDA_PATH}/bin/conda install -y  -n base  \		   
           qt==5.9.5  \
           qtawesome==0.4.4  \
           qtconsole==4.3.1  \
           qtpy==1.4.1  \
           readline==7.0  \
           requests==2.18.4   \
           rope==0.10.7   \
           rpy2==2.9.4 p  \
           ruamel_yaml==0.15.35  \
           s3transfer==0.1.13   \
           scikit-image==0.13.1   \
           scikit-learn==0.19.1   \
           scipy==1.1.0  \
           seaborn==0.8.1  \
           send2trash==1.5.0  \
           setuptools==39.2.0   \
           simplegeneric==0.8.1  \
           singledispatch==3.4.0.3  \
           sip==4.19.8   \
           six==1.11.0   \
           smart-open==1.5.6  \
           snappy==1.1.7  \
           snowballstemmer==1.2.1  \
           sortedcollections==0.6.1  \
           sortedcontainers==1.5.10   \
           sphinx==1.7.4  \
           sphinxcontrib==1.0  \
           sphinxcontrib-websupport==1.0.1  \
           spyder==3.2.8  \
           sqlalchemy==1.2.7  \
           sqlite==3.23.1   \
           statsmodels==0.9.0  \
           sympy==1.1.1  \
           tblib==1.3.2  \
           tensorboard==1.8.0  \
           tensorflow-gpu==1.8.0  \
           termcolor==1.1.0  \
           terminado==0.8.1  \
           testpath==0.3.1  \
           tk==8.6.7  \
           toolz==0.9.0  \
           tornado==5.0.2  \
           traitlets==4.3.2  \
           typing==3.6.4  \
           unicodecsv==0.14.1   \
           unixodbc==2.3.6  \
           urllib3==1.22   \
           wcwidth==0.1.7  \
           webencodings==0.5.1  \
           werkzeug==0.14.1   \
           wheel==0.31.1   \
           widgetsnbextension==3.2.1  \
           wrapt==1.10.11  \
           xlrd==1.1.0  \
           xlsxwriter==1.0.4  \
           xlwt==1.3.0  \
           xz==5.2.4  \
           yaml==0.1.7  \
           zeromq==4.2.5  \
           zict==0.1.3   \
           zlib==1.2.11 \
		   && ${CONDA_PATH}/bin/conda clean -ay \
           && find /opt/conda/ -follow -type f -name '*.a' -delete \
           && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
           && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
           && find /opt/conda/lib/python*/site-packages/bokeh/server/static -follow -type f -name '*.js' ! -name '*.min.js' -delete
		   

