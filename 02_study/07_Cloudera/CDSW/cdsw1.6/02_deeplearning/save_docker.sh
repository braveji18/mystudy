
SITE_DOMAIN=$1

echo "SITE_DOMAIN=$SITE_DOMAIN"

if [ "$SITE_DOMAIN"  == "" ]; then

   echo "example : $0  goodmit.com "
   exit 1

fi


#docker save  cuda10.docker.repository.cloudera.com/cdsw/engine:8  | gzip > cuda10.docker.repository.cloudera.com.tar.gz 

#docker save  conda.docker.repository.cloudera.com/cdsw/engine:8  | gzip > conda.docker.repository.cloudera.com.tar.gz 

docker save  tensorflow2.0.${SITE_DOMAIN}/cdsw/engine:8  | gzip > tensorflow2.0.${SITE_DOMAIN}.tar.gz 

docker save  tensorflow1.12.${SITE_DOMAIN}/cdsw/engine:8 | gzip > tensorflow1.12.${SITE_DOMAIN}.tar.gz 

docker save  pytorch1.3.${SITE_DOMAIN}/cdsw/engine:8  | gzip >  pytorch1.3.${SITE_DOMAIN}.tar.gz


