#!/bin/sh

TODAY=$(date +"%Y%m%d")
NOW=$(date +"%Y%m%d%H%M%S")

WORK_DIR=/home/admin/collect/sensor
SENSOR_NAME=$1
FROM_DT=$2
TO_DT=$3
HDFS_WORK_DIR=$4/${TODAY}
IS_OK=0

SAVE_DIR=${WORK_DIR}/data_reti/${NOW}

echo "FROM_DT=$2"
echo "TO_DT=$3"


cd ${WORK_DIR}

mkdir -p  ${SAVE_DIR}

python  ${WORK_DIR}/retigrid.py  ${SAVE_DIR}  ${SENSOR_NAME}  "${FROM_DT}"  "${TO_DT}"
if [ $? -ne 0 ]; then
    # python 에러 발생
    IS_OK=1
fi   


TXT_LIST=`ls -1  $SAVE_DIR/*.txt`
for TXT  in $TXT_LIST; do 
   echo $TXT  
   if [ -f "${TXT}"  ] ; then
       basename=`basename  ${TXT}` 
       echo $basename 
       encoded_basename=$(python -c "import urllib; print urllib.quote('''$basename''')")
       hdfs dfs -mkdir -p  ${HDFS_WORK_DIR}/
       hdfs dfs -put  ${SAVE_DIR}/${encoded_basename}  ${HDFS_WORK_DIR}/
   fi
   
done 

#rm -rf ${SAVE_DIR}
 

rm -f ${WORK_DIR}/_SUCCESS_RETI_INFO
if [ $IS_OK -ne 0 ]; then
    exit -1        
else 
    echo "" > ${WORK_DIR}/_SUCCESS_RETI_INFO
    exit 0
fi
 