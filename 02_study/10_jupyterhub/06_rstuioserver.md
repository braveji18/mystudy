
# RStudio Server 설치

```
# R 설치
yum install epel-release

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-svn21461.2.7.4-43.el7.noarch.rpm
yum install texlive-epsf-svn21461.2.7.4-43.el7.noarch.rpm

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texinfo-tex-5.1-5.el7.x86_64.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texinfo-5.1-5.el7.x86_64.rpm
yum install texinfo-5.1-5.el7.x86_64.rpm texinfo-tex-5.1-5.el7.x86_64.rpm

yum install R
# yum install --downloadonly   --downloaddir=./  R
```


```
# RStudio Server 설치
wget https://download2.rstudio.org/rstudio-server-rhel-pro-1.1.453-x86_64.rpm
sudo yum install rstudio-server-rhel-pro-1.1.453-x86_64.rpm
```

