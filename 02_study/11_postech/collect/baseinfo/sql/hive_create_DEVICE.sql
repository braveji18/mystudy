

DROP TABLE default.DEVICE ;
CREATE TABLE default.DEVICE (
  device_hash     string,
  device_name     string,
  change_date     string,
  install_date    string,
  manufacturer    string,
  device_model    string,
  device_type     string,
  device_order    string,
  sn              string,
  device_id       string,
  sensor_count    string,
  description     string,
  flag            string
  ) 
ROW FORMAT   DELIMITED
    FIELDS TERMINATED BY '|'
    COLLECTION ITEMS TERMINATED BY '\002'
    MAP KEYS TERMINATED BY '\003'
  STORED AS TextFile ;

LOAD DATA INPATH '/user/admin/base/TABLE/DEVICE/part-m-00000' INTO TABLE default.DEVICE ;


