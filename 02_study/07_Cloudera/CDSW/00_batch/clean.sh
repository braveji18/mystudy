
docker ps -a -q --filter status=exited | xargs docker rm

docker rmi $(docker images -q --filter "dangling=true" )
