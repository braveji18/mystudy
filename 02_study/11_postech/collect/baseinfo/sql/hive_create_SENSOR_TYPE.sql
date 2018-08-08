

DROP TABLE default.SENSOR_TYPE ;
CREATE TABLE default.SENSOR_TYPE (
    sensor_type            string,
    measure_item_code      string,
    item_order             string,
    item_code_name         string,
    item_code_unit         string
)
ROW FORMAT   DELIMITED
    FIELDS TERMINATED BY '|'
    COLLECTION ITEMS TERMINATED BY '\002'
    MAP KEYS TERMINATED BY '\003'
  STORED AS TextFile ;

LOAD DATA INPATH '/user/admin/base/TABLE/SENSOR_TYPE/part-m-00000' INTO TABLE default.SENSOR_TYPE ;
