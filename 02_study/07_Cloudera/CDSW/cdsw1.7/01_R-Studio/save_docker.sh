
SITE_DOMAIN=$1

echo "SITE_DOMAIN=$SITE_DOMAIN"

if [ "$SITE_DOMAIN"  == "" ]; then

   echo "example : $0  goodmit.com "
   exit 1

fi

docker save  rstudio.docker.repository.cloudera.com/cdsw/engine:10  | gzip > rstudio.docker.repository.cloudera.com.tar.gz 

docker save  rstudio.${SITE_DOMAIN}/cdsw/engine:10  | gzip > rstudio.${SITE_DOMAIN}.tar.gz 

