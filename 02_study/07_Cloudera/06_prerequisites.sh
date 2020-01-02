#!/bin/sh

NTP_SERVER_IP="100.3.1.51"

###############################
# timezone 변경 
###############################
pssh -h /root/allnodes "timedatectl set-timezone Asia/Seoul"
pssh -i -h /root/allnodes "date | grep KST "

###############################
# SELinux 비활성화
###############################
pssh -h /root/allnodes "sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config"
pssh -h /root/allnodes "setenforce 0"

###############################
# Linux Firewall 비활성화
###############################
pssh -h /root/allnodes "service iptables stop; chkconfig iptables off; service ip6tables stop; chkconfig ip6tables off"
pssh -h /root/allnodes "systemctl stop firewalld ; systemctl disable firewalld"


###############################
# Disable unneeded services
###############################
pssh -h /root/allnodes "service cups stop && chkconfig cups off "
pssh -h /root/allnodes "service postfix stop && chkconfig postfix off"

###############################
# NTP 설정
###############################
pssh -h /root/allnodes  "yum install -y ntp"

sed -i '/centos.pool.ntp.org/d' /etc/ntp.conf 

cp /etc/ntp.conf  /root/ntp.conf


cat <<EOT >> /etc/ntp.conf
server 127.127.1.0
fudge 127.127.1.0 stratum 10
EOT

echo "server ${NTP_SERVER_IP} iburst   # NTP 서버"  >>  /root/ntp.conf

# NTP 서버일 경우 
while read IP FQDN DOMAIN
do   
    if [ "$FQDN" == "" ] ;then
        continue     
    fi  
    
    if [ "$FQDN" == "localhost" ] ;then
        continue
    fi
    
    if [ "$FQDN" == "localhost" ] ;then
        continue
    fi
    
    if [ "$NTP_SERVER_IP" == "$IP" ] ;then
        ssh  ${DOMAIN}  "service ntpd start"
    fi    
done < /etc/hosts

# NTP 서버가 아닐 경우
while read IP FQDN DOMAIN
do   
    if [ "$FQDN" == "" ] ;then
        continue     
    fi  
    
    if [ "$FQDN" == "localhost" ] ;then
        continue
    fi
    
    if [ "$FQDN" == "localhost" ] ;then
        continue
    fi
    
    if [ "$NTP_SERVER_IP" == "$IP" ] ;then
        continue
    fi
    
    
    echo ${DOMAIN}
    
    scp  /root/ntp.conf   ${DOMAIN}:/etc/ntp.conf
    
    #ssh  ${DOMAIN}  "service ntpd stop"
done < /etc/hosts

pssh -h /root/allnodes "yum install -y ntpdate"
pssh -i -h /root/allnodes "ntpdate ${NTP_SERVER_IP}" # Synchronize the node.
pssh -i -h /root/allnodes "hwclock --systohc"  # Synchronize the system clock
pssh -h /root/allnodes "service ntpd start"
pssh -h /root/allnodes "chkconfig ntpd on"
pssh -i -h /root/allnodes "ntpq -pn"



###############################
# ulimit 설정
###############################
pssh -h /root/allnodes "sed -i '$ a\root soft nofile 64000' /etc/security/limits.conf"
pssh -h /root/allnodes "sed -i '$ a\root hard nofile 64000' /etc/security/limits.conf"

pssh -i -h /root/allnodes "cat /etc/security/limits.conf | grep -i root "



###############################
# Transparent Hugepage Compaction 비활성화
###############################

#CHECK_OS="`cat /etc/*-release | uniq | grep NAME`"
#HUGEPAGE_PATH="/sys/kernel/mm/redhat_transparent_hugepage"
#if [[ "$CHECK_OS" = *"CentOS"* ]]; then
#   echo "CENTOS"
   HUGEPAGE_PATH="/sys/kernel/mm/transparent_hugepage"
#fi

pssh -h /root/allnodes "echo never > ${HUGEPAGE_PATH}/defrag"
pssh -h /root/allnodes "echo never > ${HUGEPAGE_PATH}/enabled"

sed -i "$ a\echo never > ${HUGEPAGE_PATH}/defrag" /etc/rc.d/rc.local
sed -i "$ a\echo never > ${HUGEPAGE_PATH}/enabled" /etc/rc.d/rc.local

cat /etc/rc.d/rc.local

# REDHAT 일때 확인 필요 => 커널 파라미터 추가하여 주니 enabled 파일에만 never가 적용되고 defrag 파일에는 적용이안됨.
# pssh -h /root/allnodes "sed -i 's/quiet/quiet transparent_hugepage=never/g'/boot/grub/grub.conf

pscp -h /root/allnodes   /etc/rc.d/rc.local  /etc/rc.d/rc.local
pssh -h /root/allnodes  "chmod +x /etc/rc.d/rc.local "

pssh -i -h /root/allnodes "cat /etc/rc.d/rc.local "

pssh -i -h /root/allnodes "cat /proc/meminfo"



###############################
# vm.swappiness 설정
###############################
pssh -h /root/allnodes "sysctl -w vm.swappiness=1"
pssh -h /root/allnodes "sed -i '$ a\vm.swappiness=1' /etc/sysctl.conf" 


###############################
# 전체 노드 재부팅 
###############################
pssh -h /root/nodes_exclude_me "shutdown -r now"

sleep 1

shutdown -r now


