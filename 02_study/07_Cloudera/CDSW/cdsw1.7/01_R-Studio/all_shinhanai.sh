
SITE_DOMAIN=shinhanai.com


 sh 01_make.sh  && \
 sh 02_make.sh ${SITE_DOMAIN}  && \
 sh save_docker.sh ${SITE_DOMAIN}
