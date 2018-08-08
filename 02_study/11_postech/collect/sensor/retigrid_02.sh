#!/bin/sh

WORK_DIR=/home/admin/collect/sensor
HDFS_WORK_DIR=/user/reti_user02
SENSOR_NAME=$1
FROM_DT=$2
TO_DT=$3


NOW=$(date +"%Y%m%d%H%M%S")
LOG_FILE="${WORK_DIR}/log/reti_user02.${NOW}.log"

cd $WORK_DIR

echo "FROM_DT=$2" | tee -a  $LOG_FILE
echo "TO_DT=$3"  | tee -a  $LOG_FILE


./retigrid_work.sh  $SENSOR_NAME  "$FROM_DT"  "$TO_DT" "$HDFS_WORK_DIR" 2>&1 | tee -a  $LOG_FILE

if [ $? -eq 0 ];then
    echo "CMD OK!"
else
    python  ../send_mail.py  "레티그리드 연동 에러"  $LOG_FILE    
fi

#rm -f $LOG_FILE


 
