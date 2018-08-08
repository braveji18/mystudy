

DROP TABLE default.MEASURE_LOCATION ;
CREATE TABLE default.MEASURE_LOCATION (
  device_hash           string ,
  sensor_name           string ,
  change_date           string ,
  site_name             string ,
  site_floor            string ,
  site_area             string ,
  base_roomtype         string ,
  room_no               string ,
  description           string ,
  flag                  string 
  ) 
ROW FORMAT   DELIMITED
    FIELDS TERMINATED BY '|'
    COLLECTION ITEMS TERMINATED BY '\002'
    MAP KEYS TERMINATED BY '\003'
  STORED AS TextFile ;

LOAD DATA INPATH '/user/admin/base/TABLE/MEASURE_LOCATION/part-m-00000' INTO TABLE default.MEASURE_LOCATION ;


