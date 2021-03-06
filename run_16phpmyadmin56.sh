#!/bin/sh
. inc/init.sh
IMAGE="phpmyadmin/phpmyadmin"

ADD_LINKS="mysql56:db" 
#check_link
#echo $LINKS
WWW_PORT="8081"
MYSQL_PORT="3307"

docker run -d \
           -p $WWW_PORT:80 \
           -e PMA_PORT=$MYSQL_PORT \
          --name $CONTAINER \
       --restart unless-stopped \
       $LINKS \
       $IMAGE

echo "${BLUE}http://localhost:$WWW_PORT${NC}  $CONTAINER"
