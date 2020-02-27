FROM  cuda10.docker.repository.cloudera.com/cdsw/engine:8 

RUN /opt/conda/envs/python3.6/bin/pip  install tensorflow-gpu==2.0


