

DROP TABLE default.SENSOR ;
CREATE TABLE default.SENSOR (
  device_hash           string ,
  sensor_id             string ,
  change_date           string ,
  device_name           string ,
  sensor_type           string ,
  sensor_model          string ,
  sensor_name           string ,
  sensor_manufacturer   string ,
  description           string ,
  flag                  string
  ) 
ROW FORMAT   DELIMITED
    FIELDS TERMINATED BY '|'
    COLLECTION ITEMS TERMINATED BY '\002'
    MAP KEYS TERMINATED BY '\003'
  STORED AS TextFile ;

LOAD DATA INPATH '/user/admin/base/TABLE/SENSOR/part-m-00000' INTO TABLE default.SENSOR ;


