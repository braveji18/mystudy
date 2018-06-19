#!/bin/sh

USB_DIR="/mnt/usb02"
HTTP_ROOT="/var/www/html"

###############################
## centos7.x ISO에서 rpm 파일들을 /var/www/html/centos7에 복사
###############################

#fdisk -l
mkdir -p ${USB_DIR}
mount /dev/sdc1 ${USB_DIR}
ls -l ${USB_DIR}

###############################
# rpm Packages 카피
###############################
mkdir -p ${HTTP_ROOT}/centos7.x
find ${USB_DIR}/Packages/ ! -name *.i686.rpm -exec /bin/cp {}  ${HTTP_ROOT}/centos7.x/ \;

umount ${USB_DIR}


