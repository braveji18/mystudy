
LOCAL_WORK_DIR=/home/admin/collect/baseinfo
HDFS_WORK_DIR=/user/admin/base/WEATHER
TABLE_LIST=( "WEATHER"  )


cd ${LOCAL_WORK_DIR}
hdfs dfs -rm -r  ${HDFS_WORK_DIR}
#mkdir -p ${LOCAL_WORK_DIR}/data/
#rm -f   ${LOCAL_WORK_DIR}/data/*.csv  


sqoop import \
   --connect jdbc:mysql://mgmt001.data.postech/energy \
   --username energy  \
   --password vhtmxpr1! \
   --table WEATHER   \
   --warehouse-dir ${HDFS_WORK_DIR} \
   --fields-terminated-by  '|'   \
   --num-mappers 1 


for table_name  in ${TABLE_LIST[*]} ; do

  sql_file=${LOCAL_WORK_DIR}/sql/hive_create_${table_name}.sql
  if [ -f "${sql_file}"  ] ; then
    echo $sql_file 
    hive -f $sql_file 
  fi 
  
done

