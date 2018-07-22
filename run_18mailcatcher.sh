#!/bin/sh
. inc/init.sh
IMAGE="schickling/mailcatcher"
. inc/check_container.sh
WWW_PORT="1080"
docker run -d \
           -p $WWW_PORT:1080 \
          --name $CONTAINER \
       --restart unless-stopped \
       $IMAGE

echo "${BLUE}http://localhost:$WWW_PORT${NC}  $CONTAINER"
