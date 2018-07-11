#!/bin/sh


CM_SERVER="big01.goodmit.co.kr"

###############################
# Java 설치
###############################
pssh -h /root/allnodes "yum -y remove java"

pscp -h /root/nodes_exclude_me   /root/jdk-8u161-linux-x64.rpm   /root/

pssh -h /root/allnodes "yum install -y /root/jdk-8u161-linux-x64.rpm"

cat <<EOT >> ~/.bashrc
export JAVA_HOME=/usr/java/jdk1.8.0_161
export PATH=$JAVA_HOME/bin:$PATH
EOT

pscp -h /root/nodes_exclude_me  /root/.bashrc /root/.bashrc
source /root/.bashrc

pssh -i -h /root/allnodes "java -version"


###############################
# MariaDB 설치
###############################

yum install -y  mariadb-server 

service mariadb stop

/bin/cp /root/my.cnf   /etc/my.cnf


chkconfig mariadb on

service mariadb start


###############################
# MariaDB JDBC 드라이버 설치
###############################
pssh -h /root/allnodes "mkdir -p /usr/share/java/ "
pscp -h /root/allnodes  /root/mysql-connector-java.jar  /usr/share/java/


###############################
# MariaDB root password 설정
###############################
/usr/bin/mysql_secure_installation

#Enter current password for root (enter for none):
#OK, successfully used password, moving on...
#[...]
#Set root password? [Y/n] y
#New password:
#Re-enter new password:
#Remove anonymous users? [Y/n] Y
#[...]
#Disallow root login remotely? [Y/n] N
#[...]
#Remove test database and access to it [Y/n] Y
#[...]
#Reload privilege tables now? [Y/n] Y
#All done!



###############################
# Database 만들기
###############################
MY_PW=Goodmit0802!

mysql -u root -p${MY_PW}   <  /root/create_db.sql 
mysql -u root -p${MY_PW}  -e "show databases"


###############################
# Cloudera Manager Agent 패키지 설치
###############################
pssh -t 0 -h /root/allnodes "yum -y install cloudera-manager-daemons  cloudera-manager-agent "

pssh -i -h /root/allnodes "rpm -qa | grep cloudera"

sed -i "s/server_host=localhost/server_host=${CM_SERVER}/g" /etc/cloudera-scm-agent/config.ini
pscp -h /root/allnodes  /etc/cloudera-scm-agent/config.ini   /etc/cloudera-scm-agent/


###############################
#Cloudera Manager Server 패키지 설치
###############################
yum install -y cloudera-manager-server
/usr/share/cmf/schema/scm_prepare_database.sh mysql scm scm scm


###############################
# Cloudera Manager Server 시작!
###############################
pssh -h /root/allnodes "service cloudera-scm-agent start"

service cloudera-scm-server start

tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log






