

CREATE SCHEMA IF NOT EXISTS `deepbioDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `deepbioDB` ;

DROP TABLE IF EXISTS file_manifest ;

CREATE TABLE IF NOT EXISTS file_manifest (
  `id`       MEDIUMINT NOT NULL AUTO_INCREMENT,
  `disease` VARCHAR(10) NOT NULL,
  `platform_type` VARCHAR(50) NOT NULL,
  `center` VARCHAR(10) NOT NULL,
  `platform` VARCHAR(50) NOT NULL,
  `level` VARCHAR(10) NOT NULL,
  `barcode` VARCHAR(50) NOT NULL,
  `file_name` VARCHAR(512) NOT NULL,
  `reg_dt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ,
  `flag`       MEDIUMINT DEFAULT 0 ,
  PRIMARY KEY (`id`),
  index file_manifefile_annotationsst_barcode_idx(barcode) 
)
ENGINE = InnoDB;


select count(*) from file_manifest ;
select count(*) from file_manifest where file_name like '%rsem.genes.normalized_results';
select * from file_manifest where file_name like '%rsem.genes.normalized_results' limit 2;

select * from file_manifest where barcode = 'TCGA-FX-A3RE-01A-11R-A22K-07';

select * from file_manifest limit 10;
select count(*) from file_annotations;
update file_manifest set flag = 0 where id >  0 ;
commit;

DROP TABLE IF EXISTS file_annotations ;

CREATE TABLE IF NOT EXISTS file_annotations (
  `id`       MEDIUMINT NOT NULL ,
  `disease` VARCHAR(10) NOT NULL,
  `item_type` VARCHAR(50) NOT NULL,
  `item_barcode` VARCHAR(50) NOT NULL,
  `item_uuid` VARCHAR(50) NOT NULL,
  `classification` VARCHAR(10) NOT NULL,
  `category` VARCHAR(50) NOT NULL,
  `annotator` VARCHAR(50) NOT NULL,
  `date_created` VARCHAR(20) NOT NULL,
  `annotation` VARCHAR(4096) NOT NULL,
  `reg_dt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ,
  PRIMARY KEY (`id`),
  index file_annotations_barcode_idx(item_barcode) ,
  index file_annotations_uuid_idx(item_uuid) ,
  index file_annotations_date_created_idx(date_created) 
)
ENGINE = InnoDB;


-- ##############################################################
-- HBASE 스키마 정의
-- ##############################################################

disable 'mRNA'
drop 'mRNA'
create 'mRNA', {NAME => 'manifest' },  {NAME=>'data', COMPRESSION=>'SNAPPY'}





