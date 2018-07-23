
# Zeppelin 설정


## 다운로드
```
# http://zeppelin.apache.org/download.html

wget http://apache.mirror.cdnetworks.com/zeppelin/zeppelin-0.8.0/zeppelin-0.8.0-bin-all.tgz

tar xvf zeppelin-0.8.0-bin-all.tgz

cd zeppelin-0.8.0-bin-all
```


## LDAP 설정

```
# https://zeppelin.apache.org/docs/0.7.2/security/shiroauthentication.html#ldap


cp conf/shiro.ini.template conf/shiro.ini
vi conf/shiro.ini
[users] 사용자 모두 주석처리
[main]
ldapRealm = org.apache.zeppelin.realm.LdapRealm
ldapRealm.contextFactory.environment[ldap.searchBase] = dc=itzgeek,dc=local
ldapRealm.userDnTemplate = uid={0},OU=People,dc=itzgeek,dc=local
ldapRealm.contextFactory.url = ldap://10.10.1.149:389
ldapRealm.contextFactory.authenticationMechanism = simple



cp conf/zeppelin-site.xml.template  conf/zeppelin-site.xml
vi conf/zeppelin-site.xml
zeppelin.anonymous.allowed false
```


# SSL 적용

```
# https://zeppelin.apache.org/docs/0.7.0/install/configuration.html#ssl-configuration


### certificates 와 keystore 생성 
### https://wiki.eclipse.org/Jetty/Howto/Configure_SSL

keytool -keystore keystore -alias jetty -genkey -keyalg RSA
keytool -importkeystore -srckeystore keystore -destkeystore zeppelin_keystore -deststoretype pkcs12


wget https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.11.v20180605/jetty-distribution-9.4.11.v20180605.tar.gz
tar xvf jetty-distribution-9.4.11.v20180605.tar.gz

java -cp jetty-distribution-9.4.11.v20180605/lib/jetty-util-9.4.11.v20180605.jar   org.eclipse.jetty.util.security.Password <user> <password>


cd ../zeppelin-0.8.0-bin-all
vi conf/zeppelin-site.xml

<property>
  <name>zeppelin.server.ssl.port</name>
  <value>8443</value>
  <description>Server ssl port. (used when ssl property is set to true)</description>
</property>

<property>
  <name>zeppelin.ssl</name>
  <value>true</value>
  <description>Should SSL be used by the servers?</description>
</property>

<property>
  <name>zeppelin.ssl.keystore.path</name>
  <value>../zeppelin_keystore</value>
  <description>Path to keystore relative to Zeppelin configuration directory</description>
</property>

<property>
  <name>zeppelin.ssl.keystore.type</name>
  <value>PKCS12</value>
  <description>The format of the given keystore (e.g. JKS or PKCS12)</description>
</property>

<property>
  <name>zeppelin.ssl.keystore.password</name>
  <value>OBF:19r91l181kn21k171k8s1wtw1wui1k5e1jyr1kjk1kxu19p5</value>
  <description>Keystore password. Can be obfuscated by the Jetty Password tool</description>
</property>

<property>
  <name>zeppelin.ssl.key.manager.password</name>
  <value>OBF:19r91l181kn21k171k8s1wtw1wui1k5e1jyr1kjk1kxu19p5</value>
  <description>Key Manager password. Defaults to keystore password. Can be obfuscated.</description>
</property>

```


# Spark연동과 Kerberos

- zeppelin이 설치되는 서버에 hive, hdfs , spark gateway 설치 필요함.

```
# https://zeppelin.apache.org/docs/0.8.0/setup/deployment/cdh.html
# https://zeppelin.apache.org/docs/latest/interpreter/spark.html
# https://issues.apache.org/jira/browse/ZEPPELIN-446

cp conf/zeppelin-env.sh.template   conf/zeppelin-env.sh   
cat <<EOT >>  conf/zeppelin-env.sh
export MASTER=yarn-client
export HADOOP_CONF_DIR=/etc/spark/conf.cloudera.spark_on_yarn/yarn-conf  # 
export SPARK_HOME=/opt/cloudera/parcels/CDH/lib/spark
EOT

# set Spark master as yarn-client in Zeppelin Interpreters setting page

```


# SSO 적용

```
# https://stackoverflow.com/questions/43192091/how-can-i-enable-sso-login-to-apache-zeppelin-on-aws-emr
# https://medium.com/data-collective/apache-zeppelin-oauth-integration-using-apache-knox-dea2362e3dda
```



# 문제점 정리

- 로그인한 계정ID로 hadoop으로 접속되지 않고 zeppelin으로 실행한 계정ID로 hadoop에 접속
- Zeppelin을 설치하기 위해서는 cloudera 가 관리되는 서버가 필요 : hive, hdfs , spark gateway 설치 필요
- 서로 다른 계정으로 접속하여도 작업용 notebook은 동일함.
- kerberos 인증시 keytab은 하나면 등록되고  keytab에 등록된 계정으로 hadoop에 연동됨.





