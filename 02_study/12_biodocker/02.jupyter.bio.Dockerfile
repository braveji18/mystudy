FROM  macrogen/jupyter.base:01

# python 2
RUN source ~/.bashrc  && \
    conda activate base  && \
    conda install -y    \
          biopython     \
          xlrd          \
          openpyxl      

# pyton 2 
RUN source ~/.bashrc  && \
    conda activate base  && \
    conda config --add channels 'conda-forge' && \
    conda config --add channels https://conda.anaconda.org/dranew && \
    conda config --add channels 'bioconda' && \
    conda config --add channels 'r' && \
    conda install defuse             
    
RUN source ~/.bashrc && \
    conda install -c bioconda \
          sra-tools           \
          ucsc-liftover       \
          samtools=1.9        \
          bamtools=2.5.1      \
          bcftools=1.9        \
          bedtools=2.27.0    \
          sambamba            \
          seqtk               \
          picard=2.18.11      \
          gffcompare          \
          qualimap=2.2.2      \
          fastqc=0.11.7       \
          Trimmomatic=0.38    \
          bowtie=1.1.2        \
          gmap                \
          tophat=2.1.1        \
          STAR=2.6.0c         \
          bsmap=2.90          \
          blast               \
          cufflinks=2.2.1     \
          stringtie=1.3.4     \
          rsem                \
          HTSeq               \
          gatk=3              \
          perl-gdgraph        \
          vt              

RUN source ~/.bashrc      &&  \
    wget https://conda.anaconda.org/bioconda/linux-64/cnvkit-0.9.3-py27_2.tar.bz2  && \
    conda install cnvkit-0.9.3-py27_2.tar.bz2    \
                  mosdepth    \
                  openpyxl && \
    rm -f cnvkit-0.9.3-py27_2.tar.bz2   
    
# 설치가 안 되는 패키지들 
#          hisat2=2.1.0        \
#          gatk4   

ENV PROGRAM_DIR /mnt/clinix/Tools/Trans_Epi_Analysis/Programs

RUN source ~/.bashrc   && \
    cd  $PROGRAM_DIR   && \
    git clone https://github.com/lh3/seqtk.git && \
    cd seqtk && make  


# You can use the BioInstaller in Docker since v0.3.0.
# docker pull bioinstaller/bioinstaller:develop
# docker run -it -v /tmp/download:/tmp/download bioinstaller/bioinstaller:develop R

# python 2
RUN cd $PROGRAM_DIR    && \
    source ~/.bashrc   && \
    wget http://sf.net/projects/fusioncatcher/files/bootstrap.py -O bootstrap.v1.00.py && \
    python bootstrap.v1.00.py -t –download  && \
    conda install -y -c bioconda cutadapt   && \
    rm -f bootstrap.v1.00.py 

# 위치 확인 필요 
RUN cd $PROGRAM_DIR    && \
    chmod 655 fusioncatcher/bin/*.py   

# pyhon 3     
RUN source ~/.bashrc && \
    conda activate py3  && \
    pip install snakemake  && \
    conda install sambamba    \
                  numpy       \
                  scipy       \
                  xlsxwriter  \
                  pyfaidx     \
                  future   && \
    wget https://conda.anaconda.org/conda-forge/linux-64/r-cghflasso-0.2_1-r3.3.2_0.tar.bz2 && \
    conda install  r-cghflasso-0.2_1-r3.3.2_0.tar.bz2  && \
    rm -f r-cghflasso-0.2_1-r3.3.2_0.tar.bz2 
                  
# R 3.4.3 
RUN source ~/.bashrc && \
    conda activate r34  && \
    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('DNAcopy')"  && \
    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('BiocParallel')"  && \
    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('Biobase')"  && \
    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('EBSeq')"   && \
    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('monocle')" && \
    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('sincell')" && \
    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('scde')"    && \
    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('scran')"   && \
    R -e "source('http://bioconductor.org/biocLite.R'); biocLite('scater')"


RUN  mkdir /notebook
WORKDIR /notebook
EXPOSE 8888

# Set up notebook config
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly: https://github.com/ipython/ipython/issues/7062
COPY run_jupyter.sh /root/

CMD ["/root/run_jupyter.sh", "--allow-root" ]

