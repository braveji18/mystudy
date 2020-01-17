FROM  cuda10.docker.repository.cloudera.com/cdsw/engine:8


RUN mkdir -p /opt/conda/envs/python3.6
RUN conda install -y nbconvert python=3.6.1 -n python3.6

