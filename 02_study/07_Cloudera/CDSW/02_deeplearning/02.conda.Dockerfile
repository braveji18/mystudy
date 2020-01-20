FROM  cuda10.docker.repository.cloudera.com/cdsw/engine:8


RUN cd /tmp/ && \
    wget -O impala.deb https://downloads.cloudera.com/connectors/impala_odbc_2.5.41.1029/Debian/clouderaimpalaodbc_2.5.41.1029-2_amd64.deb   && \
    wget -O hive.deb   https://downloads.cloudera.com/connectors/ClouderaHive_ODBC_2.6.4.1004/Debian/clouderahiveodbc_2.6.4.1004-2_amd64.deb   && \
    dpkg -i  impala.deb hive.deb  && \
    rm -rf  *.deb

RUN mkdir -p /opt/conda/envs/python3.6
RUN conda install -y nbconvert python=3.6.1 -n python3.6 && \
    conda install -y -n python3.6 pymysql scikit-learn \
        bokeh=1.4.0 \
        matplotlib=2.0.2 \
        gensim \
        glob2 \
        h5py \
        joblib \
        mpi4py \
        multiprocess \
        nltk \
        pandas \
        pymysql \
        pyodbc \
        scipy \
        statsmodels \
        statsd \
        tqdm \
        seaborn

RUN /opt/conda/envs/python3.6/bin/pip install gputil gym  jupyterlab

RUN cd /tmp/ && \
    wget https://jaist.dl.sourceforge.net/project/libpng/zlib/1.2.9/zlib-1.2.9.tar.gz  && \
    tar -xvf zlib-1.2.9.tar.gz && \
    cd zlib-1.2.9   && \
    ./configure &&  make && make install && \
    cd /usr/lib/x86_64-linux-gnu/  && \
    ln -s -f /usr/local/lib/libz.so.1.2.9/lib libz.so.1 && \
    cd /tmp/ && rm -rf zlib-1.2.9
    
    
