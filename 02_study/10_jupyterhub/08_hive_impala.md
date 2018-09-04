
###################################################################
# hive in R
###################################################################

apt-get update -y
apt-get install  -y openjdk-8-jdk libbz2-dev libpcre3-dev liblzma-dev zlib1g-dev libicu-dev

install.packages("rJava")
library(rJava)

# https://www.cloudera.com/downloads/connectors/hive/jdbc.html

jdbc_path <- "/var/lib/cloudera"
jdbc_conn_str <- "jdbc:hive2://10.10.1.146:10000"


if(!"RJDBC" %in% rownames(installed.packages())) {
  install.packages("RJDBC")
}

hive_classpath <- list.files(path = jdbc_path, pattern = "\\.jar$", full.names = TRUE)
rJava::.jinit(classpath = hive_classpath)

library(DBI)
drv <- RJDBC::JDBC("com.cloudera.hive.jdbc41.HS2Driver", hive_classpath, "`")
hive <- dbConnect(drv, jdbc_conn_str)

dbGetQuery( hive,
  "select * from table_name")

# disconnect from Hive
dbDisconnect(hive)


###################################################################
# impala in R
###################################################################

wget https://downloads.cloudera.com/impala-jdbc/impala-jdbc-0.5-2.zip
wget https://cran.r-project.org/src/contrib/Archive/RImpala/RImpala_0.1.6.tar.gz

install.packages("RImpala_0.1.6.tar.gz")
library(RImpala)


rimpala.init(libs="/var/lib/cloudera/impala-jdbc-0.5-2/")
rimpala.connect("10.10.1.146", "21050")
rimpala.invalidate()
rimpala.showdatabases()
rimpala.usedatabase("default")
rimpala.showtables()
rimpala.close()

###################################################################
# 01.Dockerfile
###################################################################
FROM rocker/rstudio:3.4.4


RUN apt-get update -y && \
    apt-get install  -y openjdk-8-jdk libbz2-dev libpcre3-dev liblzma-dev zlib1g-dev libicu-dev

RUN mkdir -p  /var/lib/cloudera/
ADD HiveJDBC41.jar   /var/lib/cloudera/HiveJDBC41.jar

RUN wget -P  /var/lib/cloudera/   https://downloads.cloudera.com/impala-jdbc/impala-jdbc-0.5-2.zip && \
    cd /var/lib/cloudera &&  unzip impala-jdbc-0.5-2.zip  && \
    rm -f impala-jdbc-0.5-2.zip


RUN R -e "install.packages(c('rJava', 'RJDBC',  'DBI'), repos='http://cran.rstudio.com', type='source')  "
RUN R -e "install.packages(c('https://cran.r-project.org/src/contrib/Archive/RImpala/RImpala_0.1.6.tar.gz'),  type='source')  "


###################################################################
# 01.make.sh
###################################################################

docker build  -t  rstudio.3.4.4:01  . -f 01.Dockerfile

###################################################################
# 실행
###################################################################

docker run --rm -p 8787:8787 -e PASSWORD=rkskek123  rstudio.3.4.4:01

###################################################################
# save 
###################################################################









