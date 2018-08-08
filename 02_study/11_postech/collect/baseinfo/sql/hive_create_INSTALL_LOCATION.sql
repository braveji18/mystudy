

DROP TABLE default.INSTALL_LOCATION ;
CREATE TABLE default.INSTALL_LOCATION (
  device_hash      string ,
  device_name      string ,
  change_date      string ,
  base_organ       string , 
  base_sitetype    string ,  
  base_siteinout   string , 
  base_roomtype    string , 
  site_name        string , 
  site_floor       string , 
  site_area        string , 
  room_no          string , 
  description      string , 
  flag             string 
) 
ROW FORMAT   DELIMITED
    FIELDS TERMINATED BY '|'
    COLLECTION ITEMS TERMINATED BY '\002'
    MAP KEYS TERMINATED BY '\003'
  STORED AS TextFile ;

LOAD DATA INPATH '/user/admin/base/TABLE/INSTALL_LOCATION/part-m-00000' INTO TABLE default.INSTALL_LOCATION ;


