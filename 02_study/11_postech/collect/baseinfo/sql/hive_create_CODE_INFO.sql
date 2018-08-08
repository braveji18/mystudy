

DROP TABLE default.CODE_INFO ;
CREATE TABLE default.CODE_INFO (
  code_type  string ,
  code_id    string ,
  code_name  string ,
  code_etc   string ,
  reg_date   string  
) 
ROW FORMAT   DELIMITED
    FIELDS TERMINATED BY '|'
    COLLECTION ITEMS TERMINATED BY '\002'
    MAP KEYS TERMINATED BY '\003'
  STORED AS TextFile ;

LOAD DATA INPATH '/user/admin/base/TABLE/CODE_INFO/part-m-00000' INTO TABLE default.CODE_INFO ;


