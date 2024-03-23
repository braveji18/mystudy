
DROP DATABASE IF EXISTS scm ;
DROP DATABASE IF EXISTS amon ;
DROP DATABASE IF EXISTS rman ;
DROP DATABASE IF EXISTS metastore ;
DROP DATABASE IF EXISTS oozie ;
DROP DATABASE IF EXISTS hue ;

DROP DATABASE IF EXISTS ranger ;
DROP DATABASE IF EXISTS das ;
DROP DATABASE IF EXISTS schemaregistry ;
DROP DATABASE IF EXISTS smm ;

create database scm DEFAULT CHARACTER SET utf8;
grant all on scm.* TO 'scm'@'%' IDENTIFIED BY 'scm';

create database amon DEFAULT CHARACTER SET utf8;
grant all on amon.* TO 'amon'@'%' IDENTIFIED BY 'amon';

create database rman DEFAULT CHARACTER SET utf8;
grant all on rman.* TO 'rman'@'%' IDENTIFIED BY 'rman';

create database metastore DEFAULT CHARACTER SET utf8;
grant all on metastore.* TO 'hive'@'%' IDENTIFIED BY 'hive';

create database oozie DEFAULT CHARACTER SET utf8;
grant all on oozie.* TO 'oozie'@'%' IDENTIFIED BY 'oozie';

create database hue DEFAULT CHARACTER SET utf8 ;
grant all on hue.* to 'hue'@'%' identified by 'hue';



create database ranger DEFAULT CHARACTER SET utf8 ;
grant all on ranger.* to 'rangeradmin'@'%' identified by 'rangeradmin';

create database ranger DEFAULT CHARACTER SET utf8 ;
grant all on ranger.* to 'rangerkms'@'%' identified by 'rangerkms';

create database das DEFAULT CHARACTER SET utf8 ;
grant all on das.* to 'das'@'%' identified by 'das';

create database schemaregistry DEFAULT CHARACTER SET utf8 ;
grant all on schemaregistry.* to 'schemaregistry'@'%' identified by 'schemaregistry';

create database smm DEFAULT CHARACTER SET utf8 ;
grant all on smm.* to 'smm'@'%' identified by 'smm';


flush privileges;
