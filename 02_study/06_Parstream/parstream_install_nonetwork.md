

# ISO mount
mkdir -p /mnt/centos01
mkdir -p /mnt/centos02

mount -t iso9660 -o loop /root/parstream/CentOS-6.8-x86_64-bin-DVD1.iso /mnt/centos01
mount -t iso9660 -o loop /root/parstream/CentOS-6.8-x86_64-bin-DVD2.iso /mnt/centos02

mount -o loop /root/parstream/CentOS-6.8-x86_64-bin-DVD1.iso  /mnt/centos01
mount -o loop /root/parstream/CentOS-6.8-x86_64-bin-DVD2.iso  /mnt/centos02 


mount | grep loop

# create Local respostory
mkdir -p /var/www/html/centos

cp /mnt/centos01/Packages/*.rpm   /var/www/html/centos/
cp /mnt/centos02/Packages/*.rpm   /var/www/html/centos/

cd /var/www/html/centos/

rpm  -ivh  deltarpm-3.5-0.5.20090913git.el6.x86_64.rpm
rpm  -ivh  python-deltarpm-3.5-0.5.20090913git.el6.x86_64.rpm
rpm  -ivh  createrepo-0.9.9-24.el6.noarch.rpm

cd  /var/www/html/
nohup python -m SimpleHTTPServer 80 & 

createrepo  /var/www/html/centos

cat <<EOT >> /etc/yum.repos.d/centos.repo
[centos]
name = centos packages
baseurl=http://127.0.0.1/centos
gpgcheck = 0
enabled = 1
EOT


mkdir  /etc/yum.repos.d/bak
mv /etc/yum.repos.d/CentOS-*  /etc/yum.repos.d/bak
yum clean all
yum repolist



# Parstream install

## prepare install 

### stop firewall

centos6.x 

> service iptables save

> service iptables stop

> chkconfig iptables off


SELinux disabled

- vi /etc/sysconfig/selinux

> SELINUX=disabled

> setenforce 0

> getenforce


### Time sync

centos6.x 

> chkconfig ntpd on

> service ntpd restart


### Max open File 

centos6.x 

> vi /etc/security/limits.conf

```
*    hard     nofile     131072
*    soft     nofile     131072
root hard     nofile     131072
root soft     nofile     131072
```

### max_map_count settting

centos6.x 

>  vi /etc/sysctl.conf

```
vm.max_map_count = 1966080
```

> sysctl -p



## ParStream Server install


centos6.x 

> yum install -y libicu gpgme openssl
> rpm -Uhv parstream-<version>.el6.x86_64.rpm


parstream User enable

> passwd parstream


parstream setting


vi /home/parstream/.bashrc
```
export PARSTREAM_HOME=/opt/parstream
export PATH=$PARSTREAM_HOME/bin:$PATH
export LD_LIBRARY_PATH=$PARSTREAM_HOME/lib:$LD_LIBRARY_PATH
```

> source /home/parstream/.bashrc

License file install

> cp parstream.license.asc /opt/parstream/share


# Parstream Demo install

mkdir -p /psdata

cp -R /root/parstream/ps-visual    /psdata/

chown -R parstream:parstream /psdata/


# zeppelin install 

rpm -ivh oracle-j2sdk1.7-1.7.0+update67-1.x86_64.rpm

alternatives --install /usr/bin/java java /usr/java/jdk1.7.0_67-cloudera/bin/java 2

alternatives --config java


vi ~/.bashrc
```
JAVA_HOME=/usr/java/jdk1.7.0_67-cloudera
export PATH=$JAVA_HOME/bin:$PATH
```
source ~/.bashrc


default.driver => com.parstream.ParstreamDriver
default.url => jdbc:parstream://192.168.56.101:9043/visual



# juptyer install 

sh 

jupyter notebook --ip 0.0.0.0