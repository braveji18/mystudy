
# JupyterHub 와 Dockerswarm으로 분석클러스터 구성하기

## 참조 : https://github.com/jupyterhub/jupyterhub-deploy-docker


### Docker 설치

- Redhat일때 
```
audit-2.8.1-3.el7.x86_64.rpm
audit-libs-2.8.1-3.el7.x86_64.rpm
audit-libs-python-2.8.1-3.el7.x86_64.rpm
checkpolicy-2.5-6.el7.x86_64.rpm
container-selinux-2.55-1.el7.noarch.rpm
docker-ce-18.05.0.ce-3.el7.centos.x86_64.rpm
libcgroup-0.41-15.el7.x86_64.rpm
libseccomp-2.3.1-3.el7.x86_64.rpm
libselinux-2.5-12.el7.x86_64.rpm
libselinux-python-2.5-12.el7.x86_64.rpm
libselinux-utils-2.5-12.el7.x86_64.rpm
libsemanage-2.5-11.el7.x86_64.rpm
libsemanage-python-2.5-11.el7.x86_64.rpm
libsepol-2.5-8.1.el7.x86_64.rpm
pigz-2.3.3-1.el7.centos.x86_64.rpm
policycoreutils-2.5-22.el7.x86_64.rpm
policycoreutils-python-2.5-22.el7.x86_64.rpm
python-IPy-0.75-6.el7.noarch.rpm
selinux-policy-3.13.1-192.el7_5.4.noarch.rpm
selinux-policy-targeted-3.13.1-192.el7_5.4.noarch.rpm
setools-libs-3.3.8-2.el7.x86_64.rpm
```

- Centos7 일때 
```
# 참조 : https://docs.docker.com/install/linux/docker-ce/centos/
yum install docker-ce -y
```

- docker 실행 
```
systemctl start docker
systemctl enable docker
```


- Docker compose 설치
```
curl -L https://github.com/docker/compose/releases/download/1.22.0-rc2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

- Docker machine 설치
```
curl -L https://github.com/docker/machine/releases/download/v0.15.0/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
```


### HTTPS and SSL/TLS certificate
```
openssl genrsa -des3 -passout pass:x -out server.pass.key 2048 && \
    openssl rsa -passin pass:x -in server.pass.key -out jupyterhub.key && \
    rm -f server.pass.key
openssl req -new -key jupyterhub.key -out server.csr \
    -subj "/C=KO/ST=mapo/L=Seoul/O=BigData/OU=IT Department/CN=goodmit.com" && \
    openssl x509 -req -days 365 -in server.csr -signkey jupyterhub.key -out jupyterhub.crt

mkdir -p secrets
cp jupyterhub.crt jupyterhub.key secrets/    
```

### Authenticator setup
- LDAP인증을 사용하므로 LDAP 설치 및 설정방법을 참조
- https://www.itzgeek.com/how-tos/linux/centos-how-tos/step-step-openldap-server-configuration-centos-7-rhel-7.html
- https://confluence.curvc.com/pages/viewpage.action?pageId=6160880


### Build the JupyterHub Docker image
```
git clone https://github.com/jupyterhub/jupyterhub-deploy-docker.git 
cd jupyterhub-deploy-docker
```

- JupyterHub사용자 리스트 생성
```
cat <<EOT >> userlist
goodmit admin
testuser01
testuser02
EOT

cp userlist secrets/    
```

- postgres.env 파일  생성
```
cp .env secrets/postgres.env
```

- make build
```
make build
```

- 실행
```
docker-compose up -d
```


- 이후 실행시 오류 발생함
```
# .env 파일내에서 아래 부분 

# Single-user Jupyter Notebook server container image
DOCKER_NOTEBOOK_IMAGE=jupyter/minimal-notebook:e1677043235c

# the local image we use, after pinning jupyterhub version
#LOCAL_NOTEBOOK_IMAGE=jupyterhub-user
LOCAL_NOTEBOOK_IMAGE=jupyter/all-spark-notebook
```











