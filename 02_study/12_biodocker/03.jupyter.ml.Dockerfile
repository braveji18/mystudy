FROM  macrogen/jupyter.base:01

RUN source ~/.bashrc  &&    \
    conda activate base  && \
    conda install -y        \
          pandas            \
          scikit-learn      \
          numpy             \
          seaborn           \
          matplotlib  

    
RUN source ~/.bashrc &&       \
    conda activate py3  &&    \
    conda install -y          \
          pandas            \
          scikit-learn      \
          numpy             \
          seaborn           \
          matplotlib
 
RUN source ~/.bashrc && \
    conda activate r34  && \
    R -e "install.packages( c('ggplot2' ) ) "  && \


RUN  mkdir /notebook
WORKDIR /notebook
EXPOSE 8888

# Set up notebook config
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly: https://github.com/ipython/ipython/issues/7062
COPY run_jupyter.sh /root/

CMD ["/root/run_jupyter.sh", "--allow-root" ]

