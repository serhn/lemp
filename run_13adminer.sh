#!/bin/sh
. inc/init.sh
IMAGE="adminer"
WWW_PORT="8082"

docker run -d \
          --link postgres105:db \
          --link mysql57:mysql57 \
          --name $CONTAINER \
              -p $WWW_PORT:8080 \
       --restart unless-stopped \
          $IMAGE
echo "${BLUE}http://localhost:$WWW_PORT${NC}  $CONTAINER"
