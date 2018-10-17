#!/bin/sh
. inc/init.sh
IMAGE="adminer"
WWW_PORT="8080"

docker run -d \
          --link postgres105:db \
          --name $CONTAINER \
              -p $WWW_PORT:8080 \
       --restart unless-stopped \
          $IMAGE
echo "${BLUE}http://localhost:$WWW_PORT${NC}  $CONTAINER"
