#!/bin/sh


HTTP_ROOT="/var/www/html"

REPO_SERVER="192.168.2.11"

###############################
## Local 레파지토리 생성
###############################
mkdir -p /etc/yum.repos.d/bak
mv  /etc/yum.repos.d/*.repo  /etc/yum.repos.d/bak/


yum install -y ${HTTP_ROOT}/centos7.x/createrepo-*.rpm \
   ${HTTP_ROOT}/centos7.x/libxml2-python*.rpm  \
   ${HTTP_ROOT}/centos7.x/python-deltarpm*.rpm  \
   ${HTTP_ROOT}/centos7.x/deltarpm*.rpm
   

chmod 755 ${HTTP_ROOT}/*
   
cd ${HTTP_ROOT}/centos7.x/  && createrepo   .
cd ${HTTP_ROOT}/cm/         && createrepo   .

cat <<EOT >> /etc/yum.repos.d/local_rpm.repo
[localrpm]
name=local rpm
baseurl=file:///var/www/html/centos7.x/
gpgcheck=0
enabled=1
EOT

yum clean all
yum repolist all


yum install -y httpd

#httpd가 repofiles를 읽을 수 있도록 설정 <= 필요하면 설정함.
chcon -R -t httpd_sys_content_t /var/www/html/cdh
chcon -R -t httpd_sys_content_t /var/www/html/cm
chcon -R -t httpd_sys_content_t /var/www/html/centos7.x

systemctl start httpd ; systemctl enable httpd

#cd  /var/www/html/
#nohup python -m SimpleHTTPServer 80 & 


systemctl stop firewalld ; systemctl disable firewalld

rm -f /etc/yum.repos.d/local_rpm.repo

cat <<EOT >> /etc/yum.repos.d/local_os.repo
[localos]
name = local os
baseurl = http://${REPO_SERVER}/centos7.x/
gpgcheck = 0
enabled = 1
EOT


cat <<EOT >> /etc/yum.repos.d/cm.repo
[cm]
name = Cloudera CM
baseurl = http://${REPO_SERVER}/cm/
gpgcheck = 0
enabled = 1
EOT

pssh -h /root/nodes_exclude_me   "mkdir -p /etc/yum.repos.d/bak"
pssh -h /root/nodes_exclude_me   "mv  /etc/yum.repos.d/CentOS-*.repo  /etc/yum.repos.d/bak/"

pscp -h /root/nodes_exclude_me   /etc/yum.repos.d/*.repo   /etc/yum.repos.d/

pssh -h /root/allnodes   "yum clean all "
pssh -i -h /root/allnodes   "yum repolist all "

