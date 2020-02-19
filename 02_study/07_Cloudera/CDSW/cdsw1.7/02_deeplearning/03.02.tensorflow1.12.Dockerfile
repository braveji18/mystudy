FROM  conda.docker.repository.cloudera.com/cdsw/engine:10

RUN /opt/conda/envs/python3.6/bin/pip  install tensorflow-gpu==1.12.0

