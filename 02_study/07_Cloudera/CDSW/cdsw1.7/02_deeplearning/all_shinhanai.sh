
SITE_DOMAIN=shinhanai.com

 sh 01_make.sh  && \
 sh 02_make.sh  && \
 sh 03_01_make.sh ${SITE_DOMAIN}  && \
 sh 03_02_make.sh ${SITE_DOMAIN}  && \
 sh 03_03_make.sh ${SITE_DOMAIN}  && \
 sh save_docker.sh ${SITE_DOMAIN}


