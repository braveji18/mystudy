#!/bin/sh

#mysql -h mgmt001.data.postech -u energy -p
#source  /home/admin/collect/baseinfo/sql/clear_energy_tables.sql

WORK_DIR=/home/admin/collect/baseinfo
HDFS_DIR=/user/admin/base/02_metainfo

mkdir -p ${WORK_DIR}/data/02_metainfo

cd ${WORK_DIR}

hdfs dfs -get  ${HDFS_DIR}/*.xlsx  ${WORK_DIR}/data/02_metainfo

XLSX_LIST=`ls -1  ${WORK_DIR}/data/02_metainfo/*.xlsx`

IS_OK=0
XLSX_CNT=0
for XLSX  in $XLSX_LIST; do 
   XLSX_CNT=1
   echo $XLSX  
   if [ -f "${XLSX}"  ] ; then
       basename=`basename  ${XLSX}` 
       #echo $basename 
       python metainfo.py  $XLSX  
       if [ $? -ne 0 ]; then
           # python 에러 발생
           IS_OK=1
       fi       
       rm -f ${XLSX}
       hdfs dfs -rm  ${HDFS_DIR}/${basename}
   fi
done

if [ $XLSX_CNT -eq 0 ]; then
    IS_OK=1
fi

if [ $IS_OK -ne 0 ]; then
    rm -f ${WORK_DIR}/_SUCCESS_META_INFO
    exit -1        
else 
    echo "" > ${WORK_DIR}/_SUCCESS_META_INFO
    exit 0
fi


