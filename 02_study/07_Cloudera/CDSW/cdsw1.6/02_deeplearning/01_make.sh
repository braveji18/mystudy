
docker build --network=host -t cuda9.docker.repository.cloudera.com/cdsw/engine:8 . -f   01.01.cuda9.Dockerfile

docker build --network=host -t cuda10.docker.repository.cloudera.com/cdsw/engine:8 . -f  01.02.cuda10.Dockerfile

