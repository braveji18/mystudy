#!/bin/sh

WORK_DIR=/home/admin/collect/sensor
WORKING_DIR=${WORK_DIR}/data_encored/working
ENCORED_DATA=${WORK_DIR}/data_encored
ENCORED_DATA_BACKUP=${ENCORED_DATA}/backup
ENCORED_DATA_FAIL=${ENCORED_DATA}/fail
HDFS_WORK_DIR=/user/admin/encored/data01
TODAY=$(date +"%Y%m%d%H%M")

cd $WORK_DIR
mkdir -p $ENCORED_DATA_BACKUP 
mkdir -p $ENCORED_DATA_FAIL 


load_to_hive () {
    HDFS_LIST=`hdfs dfs -ls -C  ${HDFS_WORK_DIR}`
    for SENSOR_CSV  in $HDFS_LIST; do 
        #echo $SENSOR_CSV 
        basename=`basename  ${SENSOR_CSV}`         
        echo $basename 
        filename=${basename%.*}
        #echo $filename
        yyymmdd=${filename##*_}
        #echo $yyymmdd
        sensorname=${filename%_*}        
        sensorname=${sensorname//_/:}
        #sensorname=${filename%_*}        
        #sensorname=${sensorname/-/:}
        #sensorname=${sensorname/-/_}
        #sensorname=${sensorname/-/_}
        #sensorname=${sensorname//-/:}
        #sensorname=${sensorname//_/-}
        #echo $sensorname
        
        load_data="LOAD DATA INPATH '/user/admin/encored/data01/FILE_NAME' INTO TABLE iot.sensor_data PARTITION (sensor_name='SNAME', reg_date='YYYYMM' ) ;"  
        load_data=${load_data/FILE_NAME/${basename}} 
        load_data=${load_data/SNAME/${sensorname}} 
        load_data=${load_data/YYYYMM/${yyymmdd}} 
        echo $load_data
        hive -e "$load_data"
    done  
} 

IS_OK=0
CSV_LIST=`ls -1  ${ENCORED_DATA}/*.csv`
CSV_COUNT=0
for CSV  in $CSV_LIST; do 
   echo "START : $CSV  "
   if [ -f "${CSV}"  ] ; then
       CSV_COUNT=1
       basename=`basename  ${CSV}` 
       #echo $basename        
       tar  -cvzf  ${ENCORED_DATA_BACKUP}/${basename}.tar.gz   $CSV
       python  $WORK_DIR/encored.py  $CSV
       if [ $? -ne 0 ]; then
           # python 에러 발생
           IS_OK=1
           cp $CSV   $ENCORED_DATA_FAIL/
       else
           hdfs dfs -put  ${WORKING_DIR}/*.csv   $HDFS_WORK_DIR
		   echo "hdfs dfs -put  ${WORKING_DIR}/*.csv   $HDFS_WORK_DIR"
           rm -f ${WORKING_DIR}/*.csv   $HDFS_WORK_DIR
           load_to_hive           
       fi
       echo "rm -f  $CSV"
       rm -f  $CSV
   fi
   
done 




if [ $IS_OK -ne 0 ]; then
    rm -f ${WORK_DIR}/_SUCCESS_ENCORED
    exit -1        
else

    if [ $CSV_COUNT -ne 0 ]; then

        echo "" > ${WORK_DIR}/_SUCCESS_ENCORED
        exit 0
    else
        rm -f ${WORK_DIR}/_SUCCESS_ENCORED
        echo "ERROR NO DATA"
        exit -1  
    fi
 

fi





