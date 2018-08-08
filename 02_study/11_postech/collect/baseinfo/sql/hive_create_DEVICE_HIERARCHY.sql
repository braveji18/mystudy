
DROP TABLE default.DEVICE_HIERARCHY ;
CREATE TABLE default.DEVICE_HIERARCHY (
  device_hash         string, 
  device_name         string,
  parent_device_name  string,
  child_device_name   string,
  change_date         string,
  flag                string
  ) 
ROW FORMAT   DELIMITED
    FIELDS TERMINATED BY '|'
    COLLECTION ITEMS TERMINATED BY '\002'
    MAP KEYS TERMINATED BY '\003'
  STORED AS TextFile ;

LOAD DATA INPATH '/user/admin/base/TABLE/DEVICE_HIERARCHY/part-m-00000' INTO TABLE default.DEVICE_HIERARCHY ;


