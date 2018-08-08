
use energy;


DROP TABLE IF EXISTS INSTALL_LOCATION CASCADE;
CREATE TABLE IF NOT EXISTS INSTALL_LOCATION  (
  device_hash      varchar(30)  ,
  device_name      varchar(30)  ,
  change_date      timestamp    ,
  base_organ       varchar(20)  , 
  base_sitetype    varchar(20)  ,  
  base_siteinout   varchar(20)  , 
  base_roomtype    varchar(20)  , 
  site_name        varchar(20)  , 
  site_floor       varchar(20)  , 
  site_area        varchar(20)  , 
  room_no          varchar(20)  , 
  description      varchar(200) , 
  flag             varchar(10)  , 
  PRIMARY KEY ( device_hash, change_date )
) ;



DROP TABLE IF EXISTS INSTALL_LOCATION_PANEL CASCADE;
CREATE TABLE IF NOT EXISTS INSTALL_LOCATION_PANEL  (
  device_hash      varchar(30)  ,
  device_name      varchar(30)  ,
  change_date      timestamp ,   
  panel            varchar(30)  ,
  power_type       varchar(50)  ,
  power_usage      varchar(200)  ,  
  phase_wire       varchar(10)  , 
  cat_a            varchar(10)  ,
  watt_meter       varchar(50)  ,   
  description      varchar(200)  ,
  flag             varchar(10)  , 
  PRIMARY KEY (device_hash, change_date )
) ;



DROP TABLE IF EXISTS PANEL_HIERARCHY CASCADE;
CREATE TABLE IF NOT EXISTS PANEL_HIERARCHY  (
  device_hash      varchar(30)  ,
  device_name      varchar(30)  ,
  panel            varchar(30)  ,
  parent_panel     varchar(100)  ,
  child_panel      varchar(100)  ,
  change_date      timestamp ,    
  flag             varchar(10)  ,   
  PRIMARY KEY (device_hash, panel, parent_panel, child_panel, change_date )
) ;


DROP TABLE IF EXISTS DEVICE CASCADE;
CREATE TABLE IF NOT EXISTS DEVICE (
  device_hash      varchar(30)  ,
  device_name      varchar(30)  ,
  change_date      timestamp ,      
  install_date     varchar(30) ,
  manufacturer     varchar(20)  ,
  device_model     varchar(30)  ,
  device_type      varchar(30)  ,
  device_order     int  ,    
  sn               varchar(50)  ,
  device_id        varchar(30)  ,
  sensor_count     int  ,
  description      varchar(200)  ,
  flag             varchar(10)  , 
  PRIMARY KEY (device_hash, change_date )
) ;




DROP TABLE IF EXISTS DEVICE_HIERARCHY CASCADE;
CREATE TABLE IF NOT EXISTS DEVICE_HIERARCHY (
  device_hash           varchar(30)  ,
  device_name           varchar( 30 ) ,
  parent_device_name    varchar( 30 ) ,
  child_device_name     varchar( 30 ) , 
  change_date           timestamp ,    
  flag                  varchar(10)  ,     
  PRIMARY KEY (device_hash, parent_device_name, child_device_name, change_date )
) ;


DROP TABLE IF EXISTS MEASURE_LOCATION CASCADE;
CREATE TABLE IF NOT EXISTS MEASURE_LOCATION (
  device_hash           varchar(30)  ,
  sensor_id             varchar( 30 ) ,
  change_date           timestamp ,    
  sensor_name           varchar( 30 ) ,
  site_name             varchar( 20 ) ,
  site_floor            varchar( 20 ) ,
  site_area             varchar( 20 ) ,
  base_roomtype         varchar( 20 ) ,  
  room_no               varchar( 20 ) , 
  description           varchar( 200) ,  
  flag                  varchar(10) ,
  PRIMARY KEY ( device_hash, sensor_id, change_date )
) ;


DROP TABLE IF EXISTS SENSOR CASCADE;
CREATE TABLE IF NOT EXISTS SENSOR (
  device_hash           varchar(30)   ,
  sensor_id             varchar( 30 ) ,
  change_date           timestamp     ,      
  device_name           varchar( 30 ) ,
  sensor_type           varchar( 20 ) ,
  sensor_model          varchar( 20 ) ,
  sensor_name           varchar( 30 ) ,
  sensor_manufacturer   varchar( 20 ) , 
  description           varchar( 200 ),  
  flag                  varchar(10)   ,
  PRIMARY KEY (device_hash, sensor_id, change_date )
) ;


