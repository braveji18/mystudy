#
# SSH Daemon Service
# 
# Images를 선택
FROM     ubuntu:14.04
 
MAINTAINER YONGI JI <braveji@hanmail.net>
 
# 기존 미러 서버를 한국 서버로 변경
RUN sed -i 's/archive.ubuntu.com/ftp.neowiz.com/g' /etc/apt/sources.list
 
# 최신버전으로 업데이트 후 SSH 및 필요 패키지 설치 
RUN apt-get update ; apt-get install -y ssh aptitude net-tools curl
 
# SSH 관련 설정
RUN mkdir /var/run/sshd
RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config
 
# Root 비밀번호 설정
RUN echo 'root:bigbio' |chpasswd
 
# SSH 포트 설정
# HostOS의 랜덤포트 -> Container 22번 포트를 바라보게 합니다.
# 즉, 외부에서 HostOS의 랜덤 포트로 접속하면 해당 Container에 접속 할수 있습니다.
# 더 자세한건 http://docs.docker.io/reference/builder/#expose 를 참고 하세요.
EXPOSE 22
 
# SSH 실행
CMD    /usr/sbin/sshd -D