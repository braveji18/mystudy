
###################################################################
# hive in R
###################################################################

apt-get update -y
apt-get install  -y openjdk-8-jdk libbz2-dev libpcre3-dev liblzma-dev zlib1g-dev libicu-dev

install.packages("rJava")
library(rJava)

# https://www.cloudera.com/downloads/connectors/hive/jdbc.html

jdbc_path <- "/root"
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


rimpala.init(libs="/root/impala-jdbc-0.5-2/")
rimpala.connect("10.10.1.146", "21050")
rimpala.invalidate()
rimpala.showdatabases()
rimpala.usedatabase("default")
rimpala.showtables()
rimpala.close()


