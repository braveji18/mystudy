
# cx_Oracle 설치


yum install libaio
rpm -Uvh oracle-instantclient12.1-basic-12.2.0.1.0-1.x86_64.rpm
rpm -Uvh oracle-instantclient12.1-devel-12.2.0.1.0-1.x86_64.rpm
rpm -Uvh oracle-instantclient12.1-sqlplus-12.2.0.1.0-1.x86_64.rpm


echo "/usr/lib/oracle/12.1/client64/lib" | sudo tee /etc/ld.so.conf.d/oracle.conf
ldconfig

yum install gcc python-pip.noarch python-devel


conda install -c anaconda cx_oracle 
