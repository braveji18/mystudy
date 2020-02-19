
if [ "$SITE_DOMAIN"  == "" ]; then

   echo "example : $0  goodmit.com "
   exit 1

fi

docker build --network=host -t rstudio.${SITE_DOMAIN}/cdsw/engine:10 . -f  02.R_LIB.Dockerfile

