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
        matplotlib \
        gensim \
        glob2 \
        h5py \
        joblib \
        matplotlib \
        mpi4py \
        multiprocess \
        nltk \
        pandas \
        pymysql \
        pyodbc \
        scipy \
        statsmodels \
        statsd \
        tqdm
     
RUN /opt/conda/envs/python3.6/bin/pip install gputil gym 
