

# uppsercase
USER_ID=${1^^}
PASSWORD=$2
PORT=$3


if [  2 -ge $# ]; then
   echo "#############################################"
   echo "Usage : ./docker_run.sh  사원번호 비밀번호 포토번호     " 
   echo "        ./docker_run.sh  id0001   biospin1!  8081 " 
   echo "#############################################"
 
   exit -1
fi 

echo "$PASSWORD"

docker volume create ${USER_ID}

docker stop jupyter_${USER_ID} && docker rm jupyter_${USER_ID}

docker run -d  -p ${PORT}:8888 --name jupyter_${USER_ID} \
     -e "PASSWORD=${PASSWORD}"   \
     -v  ${USER_ID}:/notebook/   \
     macrogen/jupyter.base:01   


echo "http://server_ip:${PORT}"
