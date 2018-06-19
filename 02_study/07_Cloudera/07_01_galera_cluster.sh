#!/bin/sh

CM_SERVER="ai01.goodmit.co.kr"

###############################
# MariaDB 설치
###############################
cat <<EOT >> /etc/yum.repos.d/MariaDB.repo 
# MariaDB 10.1 CentOS repository list - created 2016-07-29 06:58 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOT

pscp -h dbnodes  /etc/yum.repos.d/MariaDB.repo   /etc/yum.repos.d/

pssh -h /root/dbnodes  "yum clean all"
pssh -i -h /root/dbnodes  "yum repolist all"


pssh -h /root/dbnodes  "yum install -y rsync nmap lsof perl-DBI nc"


#pssh -h /root/dbnodes "sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config"
#pssh -h /root/dbnodes "setenforce 0"
#pssh -h /root/dbnodes "systemctl disable firewalld"
#pssh -h /root/dbnodes "systemctl stop firewalld"

pssh -t 0 -h /root/dbnodes  "yum install -y MariaDB-server MariaDB-client MariaDB-compat galera socat jemalloc"

pssh -h /root/dbnodes  "service mysql start"

ssh big01 mysql_secure_installation
 ~
ssh big03 mysql_secure_installation


###############################
# Galera Cluster 설정
###############################
pssh -h /root/dbnodes  "systemctl stop mysql"

vi /etc/my.cnf.d/server.cnf
wsrep_on=ON
wsrep_provider=/usr/lib64/galera/libgalera_smm.so
wsrep_cluster_address='gcomm://10.10.1.145,10.10.1.146,10.10.1.148'
wsrep_cluster_name='cluster1.tunts'
wsrep_node_address='10.10.1.145'
wsrep_node_name='big01'
wsrep_sst_method=rsync
binlog_format=row
default_storage_engine=InnoDB
innodb_autoinc_lock_mode=2


ssh big01 galera_new_cluster
ssh big02 systemctl start mariadb
ssh big03 systemctl start mariadb

mysql -uroot -pP@ssw0rd -e "show status like 'wsrep%'"


