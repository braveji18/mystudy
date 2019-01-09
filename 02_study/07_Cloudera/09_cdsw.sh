#!/bin/sh

###############################
# DNS 설치 및 설정 
###############################
yum install -y bind.x86_64

vi /etc/named.conf
options {
        listen-on port 53 { any; };
        listen-on-v6 port 53 { ::any; };
        allow-query     { any; };

vi /etc/named.rfc1912.zones
zone "goodmit.co.kr" IN {
    type master;
    file "goodmit.co.kr.zone";
    allow-update { none; };
};

cp /var/named/named.empty   /var/named/goodmit.co.kr.zone
vi /var/named/goodmit.co.kr.zone

$TTL 3H
@       IN SOA  @ ns.goodmit.co.kr. (
                                        0       ; serial
                                        1D      ; refresh
                                        1H      ; retry
                                        1W      ; expire
                                        3H )    ; minimum
       IN NS ns.goodmit.co.kr.
       IN A  10.10.1.145

ns                   IN A  10.10.1.145
big01.goodmit.co.kr  IN A  10.10.1.145
big02.goodmit.co.kr  IN A  10.10.1.146
big03.goodmit.co.kr  IN A  10.10.1.147
cdsw.goodmit.co.kr   IN A  10.10.1.148
*.cdsw.goodmit.co.kr IN A  10.10.1.148


chown root:named /var/named/goodmit.co.kr.zone
chmod 660        /var/named/goodmit.co.kr.zone  

# bind 재시작
systemctl enable named 
systemctl restart named 

# 설정 확인
named-checkconf /etc/named.rfc1912.zones 
named-checkconf /etc/named.conf


named-checkzone goodmit.co.kr /var/named/goodmit.co.kr.zone

# bind 서버 등록
vi  /etc/resolv.conf
nameserver 10.10.1.145

# DNS 확인
nslookup aaa.cdsw.goodmit.co.kr


###############################
# 준비과정
###############################

# 01. DNS 

# 02.  Block Devices
#    - Docker Block Device 추가 : 500GB 이상
#    - /var/lib/cdsw  : application data 저장용,  SSD , 1TB

# 03. CDS 2.x Powered by Apache Spark 설치
mkdir -p /var/www/html/SPARK2
nohup wget -P /var/www/html/SPARK2 http://archive.cloudera.com/spark2/parcels/2.3.0.cloudera2/SPARK2-2.3.0.cloudera2-1.cdh5.13.3.p0.316101-el7.parcel &
nohup wget -P /var/www/html/SPARK2 http://archive.cloudera.com/spark2/parcels/2.3.0.cloudera2/SPARK2-2.3.0.cloudera2-1.cdh5.13.3.p0.316101-el7.parcel.sha1  &
nohup wget -P /var/www/html/SPARK2 http://archive.cloudera.com/spark2/parcels/2.3.0.cloudera2/manifest.json  &
nohup wget -P /var/www/html/SPARK2 http://archive.cloudera.com/spark2/csd/SPARK2_ON_YARN-2.3.0.cloudera2.jar   &
 

mkdir -p  /opt/cloudera/csd

cp  /var/www/html/SPARK2/SPARK2_ON_YARN-2.3.0.cloudera2.jar   /opt/cloudera/csd
chown cloudera-scm:cloudera-scm  /opt/cloudera/csd/ 
chown cloudera-scm:cloudera-scm  /opt/cloudera/csd/*.jar
chmod 644                        /opt/cloudera/csd/*.jar

systemctl restart cloudera-scm-server
 

# Cloudera Management Service 재시작

# CDS Powered by Apache Spark parcel을 Managing Parcels에 등록

# JAVA_HOME 설정
/usr/java/jdk1.8.0_162


 
###############################
# CDSW 설치 준비
###############################
mkdir -p     /var/www/html/cdsw
nohup wget -P /var/www/html/cdsw https://archive.cloudera.com/cdsw1/1.4.0/parcels/CDSW-1.4.0.p1.431664-el7.parcel &
nohup wget -P /var/www/html/cdsw https://archive.cloudera.com/cdsw1/1.4.0/parcels/CDSW-1.4.0.p1.431664-el7.parcel.sha &
nohup wget -P /var/www/html/cdsw https://archive.cloudera.com/cdsw1/1.4.0/parcels/manifest.json &
nohup wget -P /var/www/html/cdsw https://archive.cloudera.com/cdsw1/1.4.0/csd/CLOUDERA_DATA_SCIENCE_WORKBENCH-CDH5-1.4.0.jar &

cp  /var/www/html/cdsw/*.jar   /opt/cloudera/csd
chown cloudera-scm:cloudera-scm  /opt/cloudera/csd/*.jar
chmod 644                        /opt/cloudera/csd/*.jar
 
systemctl restart cloudera-scm-server
 
# Cloudera Data Science Workbench parcel을 Managing Parcels에 등록
 
 
 
 







