FROM  cdsw-dbs/cdsw:4.4

#https://files.pythonhosted.org/packages/80/93/f0d226061ee4679d5b593c88c7b2e9e077a271c799d29facf31bf03666c1/impyla-0.14.1.tar.gz
#https://files.pythonhosted.org/packages/aa/ef/2eb38a90ad40d0451a5228e76                                   0505567ff4cd3d8a936341a43a885fa8aa0/bitarray-0.8.2.1.tar.gz
#https://files.pythonhosted.org/packages/f4/19/cca118cf7d2087310dbc8bd70dc7df0c1320f2652873a93d06d7ba356d4a/thriftpy-0.3.9.tar.gz
#https://files.pythonhosted.org/packages/a3/58/35da89ee790598a0700ea49b2a66594140f44dec458c07e8e3d4979137fc/ply-3.11-py2.py3-none-any.whl
RUN pip install impyla && pip3 install impyla

RUN wget -O ImpalaJDBC41.jar  https://github.com/braveji18/mystudy/blob/master/02_study/07_Cloudera/ImpalaJDBC41.jar?raw=true
RUN mv ImpalaJDBC41.jar /usr/local/
RUN wget -O log4j-1.2.17.jar  https://github.com/braveji18/mystudy/blob/master/02_study/07_Cloudera/log4j-1.2.17.jar?raw=true
RUN mv log4j-1.2.17.jar /usr/local/

#RUN wget https://cran.r-project.org/src/contrib/Archive/RJDBC/RJDBC_0.2-7.tar.gz
#RUN wget https://cran.r-project.org/src/contrib/Archive/rJava/rJava_0.9-9.tar.gz
#RUN wget https://cran.r-project.org/src/contrib/Archive/DBI/DBI_0.8.tar.gz
#RUN wget http://cran.rstudio.com/src/contrib/dbplyr_1.2.1.tar.gz
#RUN wget http://cran.rstudio.com/src/contrib/implyr_0.2.4.tar.gz

RUN  add-apt-repository ppa:openjdk-r/ppa  && \
     apt-get update   && \
     apt-get install -y openjdk-7-jdk

RUN R CMD javareconf
#RUN R CMD INSTALL rJava_0.9-9.tar.gz
#RUN R CMD INSTALL DBI_0.8.tar.gz
#RUN R CMD INSTALL RJDBC_0.2-7.tar.gz
#RUN R CMD INSTALL dbplyr_1.2.1.tar.gz
#RUN R CMD INSTALL implyr_0.2.4.tar.gz

RUN R -e "install.packages(c('rJava', 'DBI', 'RJDBC', 'dbplyr', 'implyr',  'sparklyr'), repos='http://cran.rstudio.com', type='source')"


RUN rm -f *.tar.gz
