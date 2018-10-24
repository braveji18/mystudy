# Bio Docker 



### 아래 파일들을 하나의 디렉토리안에 모두 다운로드.
 
- 01.jupyter.base.Dockerfile
- 01.make.sh
- docker_run.sh
- jupyter_notebook_config.py
- run_jupyter.sh


### 설치 순서

1. Docker Image 생성하기 
```
./01.make.sh
```

2. Docker Container을 띄우기
```
# docker_run.sh  사번또는계정명     jupyter에접속할비밀번호    포트번호
./docker_run.sh  ID0001    biospin1!   8081
```