# Bio Docker 



### 아래 파일들을 하나의 디렉토리안에 모두 다운로드.
 
- 01.jupyter.base.Dockerfile
- 01.make.sh
- 02.jupyter.bio.Dockerfile
- 02.make.sh
- 03.jupyter.ml.Dockerfile
- 03.make.sh
- docker_run.sh
- jupyter_notebook_config.py
- run_jupyter.sh

### Bio Docker 만드는 순서 설정
1. 01.jupyter.base.Dockerfile 
   - python 2.7,  python 3.6,  R 3.4.3을 설치하고 jupyter 노트북으로  각각의 환경을 실행할 수 있는 기능을 제공
   - 이 도커 이미지를 기반으로 다양한 용도로 이미지를 만들기 위해서 기본적인 패키지만 설치됨.

2. 02.jupyter.bio.Dockerfile
   - bio 관련 패키지를 주로 설치
   
3. 03.jupyter.ml.Dockerfile
   - jupyter.bio기반으로 다양한 분석 라이브러리를 설치하기 위한 도커파일
   - 필요한 것을 추가 필요.
   - jupyter.base기반으로 일반적인 데이터 분석용 도커 이미지를 만들어도 됨.
   

### 빌드  순서

1. Docker  jupyter.base Image 생성하기 
```
./01.make.sh
```

2. Docker  jupyter.bio Image 생성하기 
```
./02.make.sh
```

3. Docker  jupyter.ml Image 생성하기 
```
./03.make.sh
```

4. 한번에 모드 빌드 하기
```
# 아래 명령어 치고 퇴근
nohup   ./01.make.sh &&  ./02.make.sh &&  ./03.make.sh  &

# 다음날 아침에 확인 하기 
tail -f nohup.out
```


###  Docker Container을 띄우기
```
# docker_run.sh  사번또는계정명     jupyter에접속할비밀번호    포트번호    도커명
./docker_run.sh  ID0001    biospin1!   8081   {base|bio|ml}
```

### Docker image을 다른 서버에 전달 방법
```  
docker save macrogen/jupyter.base:01 | \
gzip -c >   macrogen_jupyter.base:01.tar.gz

docker save macrogen/jupyter.bio:01 | \
gzip -c >   macrogen_jupyter.bio:01.tar.gz

docker save macrogen/jupyter.ml:01 | \
gzip -c >   macrogen_jupyter.ml:01.tar.gz

# 다른 서버에 전달
scp  *.tar.gz    ip:/download_dir/

# 다른 서버에 SSH 접속
ssh ip
docker image load --input macrogen_jupyter.base:01.tar.gz
docker image load --input macrogen_jupyter.bio:01.tar.gz
docker image load --input macrogen_jupyter.ml:01.tar.gz

``` 



