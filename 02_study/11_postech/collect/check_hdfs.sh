#!/bin/sh

WORK_DIR=/home/admin/collect
 
NOW=$(date +"%Y%m%d%H%M%S")
REPORT_FILE="dfsadmin_report_${NOW}.txt"
MAX_PERCENT=80.0

cd ${WORK_DIR}


hdfs dfsadmin -report > $WORK_DIR/${REPORT_FILE}


while read LINE  
do 
   if [[ "$LINE" == *"DFS Used%: "* ]]; then
       DFS_USED=${LINE#DFS Used%: }
       DFS_USED_PERCENT=${DFS_USED%\%}
       if [ `expr $DFS_USED_PERCENT \> $MAX_PERCENT` = 1 ] ;  then
           echo "DFS_USED_PERCENT > $MAX_PERCENT"
           python  send_mail.py  "하둡 용량 경고  $MAX_PERCENT % 이상 사용중."  $WORK_DIR/${REPORT_FILE} 
           rm -f ${WORK_DIR}/${REPORT_FILE}
           exit -1
       else
           echo "DFS_USED_PERCENT < $MAX_PERCENT"
           rm -f ${WORK_DIR}/${REPORT_FILE}
           exit 0
       fi
   fi
   
done < ${WORK_DIR}/${REPORT_FILE}

