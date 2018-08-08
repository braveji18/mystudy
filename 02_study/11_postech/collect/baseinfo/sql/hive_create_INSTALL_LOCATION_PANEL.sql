

DROP TABLE default.INSTALL_LOCATION_PANEL ;
CREATE TABLE default.INSTALL_LOCATION_PANEL (
  device_hash      string , 
  device_name      string ,
  change_date      string ,
  panel            string ,
  power_type       string ,
  power_usage      string ,
  phase_wire       string ,
  cat_a            string ,
  watt_meter       string ,
  description      string , 
  flag             string 
  ) 
ROW FORMAT   DELIMITED
    FIELDS TERMINATED BY '|'
    COLLECTION ITEMS TERMINATED BY '\002'
    MAP KEYS TERMINATED BY '\003'
  STORED AS TextFile ;

LOAD DATA INPATH '/user/admin/base/TABLE/INSTALL_LOCATION_PANEL/part-m-00000' INTO TABLE default.INSTALL_LOCATION_PANEL ;


