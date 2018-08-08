

DROP TABLE default.PANEL_HIERARCHY ;
CREATE TABLE default.PANEL_HIERARCHY (
  device_hash      string ,
  device_name      string ,
  panel            string ,
  parent_panel     string ,
  child_panel      string ,
  change_date      string ,
  flag             string 
  ) 
ROW FORMAT   DELIMITED
    FIELDS TERMINATED BY '|'
    COLLECTION ITEMS TERMINATED BY '\002'
    MAP KEYS TERMINATED BY '\003'
  STORED AS TextFile ;

LOAD DATA INPATH '/user/admin/base/TABLE/PANEL_HIERARCHY/part-m-00000' INTO TABLE default.PANEL_HIERARCHY ;


