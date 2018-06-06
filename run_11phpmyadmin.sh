#!/bin/sh
. inc/init.sh
IMAGE="phpmyadmin/phpmyadmin"
. inc/check_container.sh
docker run -d \
           -p 8080:80 \
          --name $CONTAINER \
       --restart unless-stopped \
       --link mysql:db \
       $IMAGE
