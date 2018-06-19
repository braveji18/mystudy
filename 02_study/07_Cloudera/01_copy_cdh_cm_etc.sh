#!/bin/sh

USB_DIR="/mnt/usb01"
HTTP_ROOT="/var/www/html"

###############################
## Cloudera 관련 설치 파일 복사
###############################

#fdisk -l
mkdir -p ${USB_DIR}
mount /dev/sdb1 ${USB_DIR}
ls -l ${USB_DIR}


mkdir -p ${HTTP_ROOT}
/bin/cp ${USB_DIR}/Cloudera/*  /root/  
/bin/cp -R ${USB_DIR}/Cloudera/cm   ${HTTP_ROOT}

/bin/cp -R ${USB_DIR}/Cloudera/cdh   ${HTTP_ROOT}

umount ${USB_DIR}

yum install -y /root/pssh-*.rpm


