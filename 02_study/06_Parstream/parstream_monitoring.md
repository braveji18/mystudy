

#  Graphite

- http://centoshowtos.org/monitoring/graphite/


Getting the software installed on CentOS is fairly straightforward with RPM packages available in the EPEL repository.

> yum install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm -y


Install graphite software and MySQL for backend

>  yum install graphite-web graphite-web-selinux mysql mysql-server MySQL-python -y


Start MySQL, lock it down, and create a Graphite database and user.

> /etc/init.d/mysqld start

> mysql_secure_installation

Create graphite db, username and password

> mysql -e "CREATE DATABASE graphite;" -u root -p

> mysql -e "GRANT ALL PRIVILEGES ON graphite.* TO 'graphite'@'localhost' IDENTIFIED BY 'graphitePW01Vxzsigavms';" -u root -p

> mysql -e 'FLUSH PRIVILEGES;' -u root -p