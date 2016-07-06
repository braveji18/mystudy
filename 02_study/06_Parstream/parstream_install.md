
# Parstream 설치

## 준비작업

### 방화벽 정지

- centos6.x 

> service iptables save

> service iptables stop

> chkconfig iptables off


### 방화벽 정지

- SELinux 비활성화

> vi /etc/sysconfig/selinux

> SELINUX=disabled

> setenforce 0

> getenforce


### 시간동기화

- centos6.x 
```
chkconfig ntpd on
service ntpd restart
```

### 최대 open가능한 파일수 설정

- centos6.x 
```
vi /etc/security/limits.conf
*    hard     nofile     131072
*    soft     nofile     131072
root hard     nofile     131072
root soft     nofile     131072
```

### max_map_count 커널 파타메타 설정

- centos6.x 
```
vi /etc/sysctl.conf
vm.max_map_count = 1966080

sysctl -p
```


## ParStream Server 설치


- centos6.x 
```
yum install -y libicu gpgme openssl
rpm -Uhv parstream-<version>.el6.x86_64.rpm
```

- parstream계정 로그인활성황
```
passwd parstream
```

- parstream 환경설정
```
cat <<EOT >> /home/parstream/.bashrc
#export PARSTREAM_HOME=/opt/parstream
export PATH=$PARSTREAM_HOME/bin:$PATH
export LD_LIBRARY_PATH=$PARSTREAM_HOME/lib:$LD_LIBRARY_PATH
EOT

source /home/parstream/.bashrc
```

- License파일 설치
```
cp parstream.license.asc /opt/parstream/share
```

