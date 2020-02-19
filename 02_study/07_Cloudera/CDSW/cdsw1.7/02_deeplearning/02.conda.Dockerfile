FROM  cuda10.docker.repository.cloudera.com/cdsw/engine:10

RUN cd /tmp/ && \
    apt-get update &&  \
    apt-get install -y --no-install-recommends  \
            libssl-dev \
            libmariadb-client-lgpl-dev \
            mysql-client libmysqlclient20 \
            libxml2-dev  libnlopt-dev  \
            unixodbc-dev iodbc libiodbc2  \
            xorg libx11-dev  libglu1-mesa-dev  libfreetype6-dev   \
            libgmp-dev   libblas-dev libblas3  && \
    wget -O impala.deb --no-check-certificate https://downloads.cloudera.com/connectors/impala_odbc_2.5.41.1029/Debian/clouderaimpalaodbc_2.5.41.1029-2_amd64.deb && \
    wget -O hive.deb --no-check-certificate  https://downloads.cloudera.com/connectors/ClouderaHive_ODBC_2.6.4.1004/Debian/clouderahiveodbc_2.6.4.1004-2_amd64.deb && \
    dpkg -i  impala.deb hive.deb  && \
    rm -rf  *.deb && rm -rf /var/lib/apt/lists/* 
  

RUN mkdir -p /opt/conda/envs/python3.6  && \
    conda install -y nbconvert python=3.6.9 -n python3.6 && \
    conda install -y -n python3.6 bokeh  && \
    conda install -y -n python3.6 gensim  && \
    conda install -y -n python3.6 glob2  && \
    conda install -y -n python3.6 h5py  && \
    conda install -y -n python3.6 joblib  && \
    conda install -y -n python3.6 mpi4py  && \
    conda install -y -n python3.6 multiprocess  && \
    conda install -y -n python3.6 nltk  && \
    conda install -y -n python3.6 pandas  && \
    conda install -y -n python3.6 pymysql  && \
    conda install -y -n python3.6 pyodbc  && \
    conda install -y -n python3.6 scipy  && \
    conda install -y -n python3.6 statsmodels  && \
    conda install -y -n python3.6 statsd  && \
    conda install -y -n python3.6 tqdm  && \
    conda install -y -n python3.6 seaborn  && \
    conda install -y -n python3.6 matplotlib  && \
    conda install -y -n python3.6 pymysql scikit-learn 
     
RUN /opt/conda/envs/python3.6/bin/pip install gputil gym  jupyterlab  && \
    pip3 install jupyterlab 

RUN cd /tmp/ && \
    wget --no-check-certificate  https://jaist.dl.sourceforge.net/project/libpng/zlib/1.2.9/zlib-1.2.9.tar.gz  && \
    tar -xvf zlib-1.2.9.tar.gz && \
    cd zlib-1.2.9   && \
    ./configure &&  make && make install && \
    cd /usr/lib/x86_64-linux-gnu/  && \
    ln -s -f /usr/local/lib/libz.so.1.2.9/lib libz.so.1 && \
    cd /tmp/ && rm -rf zlib-1.2.9
 
