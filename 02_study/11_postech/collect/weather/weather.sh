#!/bin/sh

WORK_DIR=/home/admin/collect/weather
NOW=$(date +"%Y%m%d%H%M%S")
LOG_FILE="${WORK_DIR}/log/weather.${NOW}.log"

cd $WORK_DIR

./weather_work.sh 2>&1 | tee -a  $LOG_FILE

if [ -f "${WORK_DIR}/_SUCCESS_WEATHER" ] ; then
    echo "CMD OK!"
else
    echo "send error mail !!"
    python  ../send_mail.py  "기상청(날씨) 연동 에러"  $LOG_FILE    
fi

#rm -f $LOG_FILE