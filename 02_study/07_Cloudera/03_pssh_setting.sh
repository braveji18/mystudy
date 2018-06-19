#!/bin/sh


###############################
# # pssh를 rpm 버전으로 설치하면, pscp는 pscp.pssh 이렇게 실행시켜야 함.
###############################
PSCP_OUT=`which pscp.pssh`

if [[ "$PSCP_OUT" = *"pscp.pssh"* ]]; then
   echo ${PSCP_OUT}
   
   echo "alias pscp=\"pscp.pssh\" " >>  ~/.bashrc
   source ~/.bashrc
   
   cat ~/.bashrc
fi


###############################
# 호스트 파일에 IP와 도메인 등록 
###############################
echo "add IPs and Domain names in hosts."

cat <<EOT >> /etc/hosts

192.168.2.11  ai01.goodmit.co.kr  ai01
192.168.2.12  ai02.goodmit.co.kr  ai02
192.168.2.13  ai03.goodmit.co.kr  ai03
192.168.2.14  ai04.goodmit.co.kr  ai04
192.168.2.15  ai05.goodmit.co.kr  ai05

EOT


cat /etc/hosts

###############################
# ssh-keygen
###############################
echo "ssh-keygen"

yes '' | ssh-keygen -N ""

ls -al ~/.ssh

###############################
# ssh-copy-id 와 allhost 파일 생성
###############################
echo "ssh-copy-id and create allhost file"

rm -f  /root/allnodes
rm -f  /root/nodes_exclude_me

#ROOT_PW='Goodmit0802!'
MY_HOST_NAME=`hostname`
while read IP FQDN DOMAIN
do   
    if [ "$FQDN" == "" ] ;then
        continue     
    fi  
    
    if [ "$FQDN" == "localhost" ] ;then
        continue
    fi

    ssh-copy-id -i ~/.ssh/id_rsa.pub  ${DOMAIN}
    
    echo ${DOMAIN} >> /root/allnodes
    
    if [ "$FQDN" == "$MY_HOST_NAME" ] ;then
        continue
    fi
    
    echo ${DOMAIN} >> /root/nodes_exclude_me
    
done < /etc/hosts


cat /root/allnodes

cat /root/nodes_exclude_me

###############################
# /etc/hosts 파일을 모든 노드에 복사
###############################
pscp -h /root/allnodes   /etc/hosts   /etc/hosts  

pssh -i -h /root/allnodes   "cat /etc/hosts"

