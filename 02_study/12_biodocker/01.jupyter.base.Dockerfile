FROM  centos:7.4.1708

ENV PROGRAM_DIR /mnt/clinix/Tools/Trans_Epi_Analysis/Programs 

RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum repolist all  &&  yum install -y wget bzip2 libSM   &&  \
    mkdir -p ${PROGRAM_DIR}  && \ 
    wget --quiet https://repo.anaconda.com/archive/Anaconda2-5.3.0-Linux-x86_64.sh   -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p  ${PROGRAM_DIR}/Miniconda2    && \
    rm ~/anaconda.sh && \
    ln -s ${PROGRAM_DIR}/Miniconda2/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". ${PROGRAM_DIR}/Miniconda2/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc


RUN source ~/.bashrc  && \
    conda activate base  && \
    conda install ipykernel

RUN source ~/.bashrc  && \
    conda create -n py3 python=3.6 && \
    conda activate py3   && \
    conda install ipykernel   && \
    python -m ipykernel install --user --name py3  --display-name "python 3"

RUN  yum group install -y "Development Tools"  && \
     yum install -y libX11.i686 libXrender  cairo-devel

# https://repo.continuum.io/pkgs/r/linux-64/
RUN source ~/.bashrc  && \
    conda create -n r34  && \
    conda activate r34  && \
    conda install -y r-base=3.4.3   r-essentials=3.4.3  && \
    R -e "IRkernel::installspec(name='ir34', displayname='R 3.4.3')" 

#RUN source ~/.bashrc  && \
#    conda create -n r35  && \
#    conda activate r35  && \
#    conda install -y r-essentials=3.5.0  && \
#    R -e "IRkernel::installspec(name='ir35', displayname='R 3.5.0')"


RUN  mkdir /notebook
WORKDIR /notebook
EXPOSE 8888

# Set up notebook config
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly: https://github.com/ipython/ipython/issues/7062
COPY run_jupyter.sh /root/

CMD ["/root/run_jupyter.sh", "--allow-root" ]

