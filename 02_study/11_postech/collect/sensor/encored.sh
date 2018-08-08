#!/bin/sh

WORK_DIR=/home/admin/collect/sensor

NOW=$(date +"%Y%m%d%H%M%S")
LOG_FILE="${WORK_DIR}/log/encored.${NOW}.log"

cd $WORK_DIR

./encored_work.sh  2>&1 | tee -a  $LOG_FILE

if [ -f "${WORK_DIR}/_SUCCESS_ENCORED" ] ; then
    echo "CMD OK!"
else
    echo "send error mail !!"
    python  ../send_mail.py  "인코어드데이터 변환 에러"  $LOG_FILE    
    exit -1    
fi

#rm -f $LOG_FILE