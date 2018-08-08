#!/bin/sh

#mysql -h mgmt001.data.postech -u energy -p
#source  /home/admin/collect/baseinfo/sql/clear_energy_tables.sql

WORK_DIR=/home/admin/collect/baseinfo

NOW=$(date +"%Y%m%d%H%M%S")
LOG_FILE="${WORK_DIR}/log/baseinfo.${NOW}.log"

mkdir -p ${WORK_DIR}/log/

cd $WORK_DIR

./baseinfo_work.sh  2>&1 | tee -a  $LOG_FILE 

if [ -f "${WORK_DIR}/_SUCCESS_BASE_INFO" ] ; then
    echo "CMD OK!!"
else
    echo "send error mail !!"
    python  ../send_mail.py  "기준정보 업로드 에러"  $LOG_FILE    
    exit -1
fi

#rm -f $LOG_FILE