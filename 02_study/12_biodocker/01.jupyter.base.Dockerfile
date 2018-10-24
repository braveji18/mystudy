FROM  centos:7.4.1708

RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum repolist all  &&  yum install -y wget bzip2 libSM   &&  \
    wget --quiet https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc


# https://repo.continuum.io/pkgs/r/linux-64/

RUN source ~/.bashrc  &&  \
    conda install --quiet --yes \
           r-essentials=3.5.0  

RUN source ~/.bashrc && \
    R -e "install.packages(c('rzmq','repr','IRkernel','IRdisplay'), repos = c('http://irkernel.github.io/', getOption('repos'))) ; IRkernel::installspec() "


#    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('BiocParallel')"  && \
#    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('Biobase')"  && \
#    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('EBSeq')"   && \
#    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('monocle')" && \
#    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('sincell')" && \
#    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('scde')"    && \
#    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('scran')"   && \
#    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('scater')"


RUN  mkdir /notebook
WORKDIR /notebook
EXPOSE 8888

# Set up notebook config
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly: https://github.com/ipython/ipython/issues/7062
COPY run_jupyter.sh /root/

CMD ["/root/run_jupyter.sh", "--allow-root" ]

