#!/bin/sh
. inc/init.sh
IMAGE="phpmyadmin/phpmyadmin"

LINKS="--link=mysql57:db" 
WWW_PORT="8081"
MYSQL_PORT="3306"

docker run -d \
           -p $WWW_PORT:80 \
          --name $CONTAINER \
           -e PMA_PORT:$MYSQL_PORT \
       --restart unless-stopped \
       $LINKS \
       $IMAGE

echo "${BLUE}http://localhost:$WWW_PORT${NC}  $CONTAINER"

