
DROP TABLE default.WEATHER ;
CREATE TABLE default.WEATHER (
  area_do        string,
  area_gu        string,
  area_dong      string,
  base_date      string,
  T1H            string,
  RN1            string,
  SKY            string,
  UUU            string,
  VVV            string,
  REH            string,
  PTY            string,
  LGT            string,
  VEC            string,
  WSD            string,
  A01_2          string,
  A07            string,
  A03            string,
  A05            string,
  A06            string,
  A08            string,
  A09            string
)
ROW FORMAT   DELIMITED
    FIELDS TERMINATED BY '|'
    COLLECTION ITEMS TERMINATED BY '\002'
    MAP KEYS TERMINATED BY '\003'
  STORED AS TextFile ;

LOAD DATA INPATH '/user/admin/base/WEATHER/WEATHER/part-m-00000' INTO TABLE default.WEATHER ;
