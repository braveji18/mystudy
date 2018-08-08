

DROP TABLE default.CODE_TYPE ;
CREATE TABLE default.CODE_TYPE (
  code_type  string  ,
  type_name  string  ,
  reg_date   string  ) 
ROW FORMAT   DELIMITED
    FIELDS TERMINATED BY '|'
    COLLECTION ITEMS TERMINATED BY '\002'
    MAP KEYS TERMINATED BY '\003'
  STORED AS TextFile ;

LOAD DATA INPATH '/user/admin/base/TABLE/CODE_TYPE/part-m-00000' INTO TABLE default.CODE_TYPE ;


