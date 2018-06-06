#!/bin/sh
. inc/init.sh
IMAGE="schickling/mailcatcher"
. inc/check_container.sh
docker run -d \
           -p 1080:1080 \
          --name $CONTAINER \
       --restart unless-stopped \
       $IMAGE
