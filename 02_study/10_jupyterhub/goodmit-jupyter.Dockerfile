FROM jupyterhub/jupyterhub

MAINTAINER YGJI  <ygji@goodmit.co.kr>

RUN apt-get update &&  \
    apt-get upgrade -y &&   \
    apt-get install -y wget libsm6 libxrender1 libfontconfig1 libglib2.0-0 \
                       fonts-dejavu tzdata gfortran gcc 

# Install miniconda
RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3 && \
    rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH /opt/miniconda3/bin:$PATH
RUN chmod -R a+rx /opt/miniconda3

# Install PyData modules and IPython dependencies
RUN conda update --quiet --yes conda && \
    conda install --quiet --yes numpy scipy pandas matplotlib cython pyzmq scikit-learn  \
          seaborn six statsmodels pip tornado jinja2 sphinx pygments nose readline sqlalchemy \
          ipython jupyter  
    
# Set up IPython kernel
RUN rm -rf /usr/local/share/jupyter/kernels/* && \
    python -m IPython kernelspec install-self
    
RUN pip3 install --upgrade jupyterhub notebook
RUN pip3 install dockerspawner  jupyterhub-ldapauthenticator

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN conda clean -y -t

# Generate self-signed certificate
RUN openssl genrsa -des3 -passout pass:x -out server.pass.key 2048 && \
    openssl rsa -passin pass:x -in server.pass.key -out server.key && \
    rm server.pass.key
RUN openssl req -new -key server.key -out server.csr \
    -subj "/C=KO/ST=mapo/L=Seoul/O=BigData/OU=IT Department/CN=goodmit.com" && \
    openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
RUN cp server.crt /etc/ssl/certs/ && \
    cp server.key /etc/ssl/certs/

# If you have your own custom jupyterhub config, overwrite it.
ADD jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py
