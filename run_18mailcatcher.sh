#!/bin/sh
. inc/init.sh
IMAGE="schickling/mailcatcher"
WWW_PORT="1080"
docker run -d \
           -p $WWW_PORT:1080 \
          --name $CONTAINER \
       --restart unless-stopped \
       $IMAGE
echo "SMTP -> HOST:mailcatcher PORT:1025i\n";
echo "${BLUE}http://localhost:$WWW_PORT${NC}  $CONTAINER"
