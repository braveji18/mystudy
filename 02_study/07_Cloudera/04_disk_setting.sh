#!/bin/sh

###############################
##  파티션생성
###############################

#fdisk -l 을 이용해서 디스크 정보 확인
#기본 OS영역 : 100GB


DISK_DEV="/dev/sdb"
DISK_DEV="/dev/sdc"

fdisk ${DISK_DEV}
mkfs.ext4 -m 0 ${DISK_DEV}1

mkdir -p /home/data01
mount -t ext4 -o noatime ${DISK_DEV}1 /home/data01

echo "${DISK_DEV}1   /home/data01    ext4    defaults,noatime     0 0"   >> /etc/fstab

cat /etc/fstab 

