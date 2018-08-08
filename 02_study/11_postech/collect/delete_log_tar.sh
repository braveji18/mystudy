#!/bin/sh

WORK_DIR=/home/admin/collect

# delete LOG 
find ${WORK_DIR}/baseinfo/log/*.log  -type f   -mtime +30 -exec rm -f {} \;
find ${WORK_DIR}/sensor/log/*.log    -type f   -mtime +30 -exec  rm -f  {} \;
find ${WORK_DIR}/weather/log/*.log   -type f   -mtime +30 -exec  rm -f {} \;


# delete backup tar 
find ${WORK_DIR}/sensor/data_encored/backup/*.gz -type f   -mtime +30 -exec  rm -f {} \;
find ${WORK_DIR}/sensor/data_encored/fail/*.csv -type f   -mtime +30 -exec  rm -f {} \;
