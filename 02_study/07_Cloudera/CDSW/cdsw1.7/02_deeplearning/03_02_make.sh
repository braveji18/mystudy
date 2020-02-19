
SITE_DOMAIN=$1

echo "SITE_DOMAIN=$SITE_DOMAIN"

if [ "$SITE_DOMAIN"  == "" ]; then

   echo "example : $0  goodmit.com "
   exit 1

fi

docker build --network=host -t tensorflow1.12.${SITE_DOMAIN}/cdsw/engine:10 . -f  03.02.tensorflow1.12.Dockerfile

