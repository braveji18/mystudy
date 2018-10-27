

# uppsercase
USER_ID=${1^^}
PASSWORD=$2
PORT=$3
DOCKER_NAME=$4


if [  2 -ge $# ]; then
   echo "#############################################"
   echo "Usage : ./docker_run.sh  사원번호 비밀번호   포토번호 도커명           " 
   echo "        ./docker_run.sh  id0001   biospin1!  8081     {base|bio|ml}    " 
   echo "#############################################"
 
   exit -1
fi 

# 사용자들사이에서 의도치 않게 소스가 공유가 되지 않도록 
# 사원번호로 저장 공간을 만들어줌.
docker volume create ${USER_ID}

echo "=========source save directory =============" 
docker volume inspect  ${USER_ID}

# 이미 같은 이름의 컨테이너가 실행되어 있으면 종료 시킴 
# 실제 사용시에는 주석처리
docker stop jupyter_${USER_ID} && docker rm jupyter_${USER_ID}

if [ "$DOCKER_NAME" = "" ]; then
   DOCKER_NAME=bio
fi

docker run -d  -p ${PORT}:8888 --name jupyter_${USER_ID} \
     -e "PASSWORD=${PASSWORD}"   \
     -v  ${USER_ID}:/notebook/   \
     macrogen/jupyter.${DOCKER_NAME}:01    

docker logs jupyter_${USER_ID} 

echo "http://server_ip:${PORT}"


