# 운영 배치용 docker 이미지
FROM ubuntu:16.04


RUN cp /etc/apt/sources.list /etc/apt/sources.list~ && \
    sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list && \
    apt-get update  -y && apt-get install  -y wget bzip2 && \
    echo "deb https://cran.rstudio.com/bin/linux/ubuntu xenial universe" >> /etc/apt/sources.list && \
    apt-get -y build-dep r-base

RUN cd /root/  && \
    wget https://cran.rstudio.com/src/base/R-3/R-3.3.3.tar.gz  && \
    tar xvf R-3.3.3.tar.gz  && \
    cd R-3.3.3/  && \
    ./configure --prefix=/opt/R/3.3.3 --enable-R-shlib && \
    make && \
    make install && \
    ln -s /opt/R/3.3.3/bin/R /bin/R  && \
        cd .. && rm -rf R-3.3.3

ENV CONDA_PATH  /opt/conda

RUN wget https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh -O anaconda.sh && \
    rm -rf ${CONDA_PATH} && \
        bash anaconda.sh -b  -p ${CONDA_PATH} && \
    rm -f anaconda.sh && \
        ln -s ${CONDA_PATH}/profile.d/conda.sh /etc/profile.d/conda.sh

#RUN mkdir -p /opt/conda/envs/python3.6
#RUN ${CONDA_PATH}/bin/conda install -y nbconvert python=3.6.5 -n python3.6

