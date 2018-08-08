#!/bin/sh

WORK_DIR=/home/admin/collect/sensor
HDFS_WORK_DIR=/user/admin/daliwork
IS_OK=0

cd $WORK_DIR
mkdir -p $WORK_DIR/data/
hdfs dfs -mkdir -p  ${HDFS_WORK_DIR}

python  $WORK_DIR/thingsplus.py 
if [ $? -ne 0 ]; then
    # python 에러 발생
    IS_OK=1
fi   

CSV_LIST=`ls -1  $WORK_DIR/data/*.csv`
for CSV  in $CSV_LIST; do 
   echo $CSV  
   if [ -f "${CSV}"  ] ; then
       basename=`basename  ${CSV}` 
       #encoded_basename=$(python -c "import urllib; print urllib.quote('''$basename''')")
       MV_CSV=${WORK_DIR}/data/${basename//#/_}
       #echo ${MV_CSV}
       mv ${WORK_DIR}/data/${basename}    ${MV_CSV}
       
       hdfs dfs -put  ${MV_CSV}  ${HDFS_WORK_DIR} 
       #fname=${basename%.*}
       #sname=${fname%_*}
       #yyyymm=${fname##*_}
       #yyyymm=${yyyymm:0:6}
       
       #echo $basename 
       filename=${basename%.*}
       #echo $filename
       yyymmdd=${filename##*_}
       #echo $yyymmdd
       sensorname=${filename%_*}        
       sensorname=${sensorname//#/:}
       #sensorname=${sensorname/-/_}
       #sensorname=${sensorname/-/_}
       #sensorname=${sensorname//-/:}
       #sensorname=${sensorname//_/-}
       #echo $sensorname       
       
       load_data="LOAD DATA INPATH '/user/admin/daliwork/FILE_NAME' INTO TABLE iot.sensor_data PARTITION (sensor_name='SNAME', reg_date='YYYYMM' ) ;"  
       load_data=${load_data/FILE_NAME/${basename//#/_}} 
       load_data=${load_data/SNAME/${sensorname}} 
       load_data=${load_data/YYYYMM/${yyymmdd}} 
       echo $load_data
       hive -e "$load_data"

       rm -f ${MV_CSV}
   fi
   
done 

rm -f ${WORK_DIR}/_SUCCESS_THINGSPLUS_INFO
if [ $IS_OK -ne 0 ]; then
    exit -1        
else 
    echo "" > ${WORK_DIR}/_SUCCESS_THINGSPLUS_INFO
    exit 0
fi



 
