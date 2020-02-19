FROM  conda.docker.repository.cloudera.com/cdsw/engine:10

RUN conda install -n python3.6  -c anaconda pytorch-gpu=1.3.1 torchvision 

