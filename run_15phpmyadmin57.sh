#!/bin/sh
. inc/init.sh
IMAGE="phpmyadmin/phpmyadmin"
. inc/check_container.sh

ADD_LINKS="mysql57:db" 
check_link
#echo $LINKS
WWW_PORT="8080"
MYSQL_PORT="3306"

docker run -d \
           -p $WWW_PORT:80 \
          --name $CONTAINER \
           -e PMA_PORT:$MYSQL_PORT \
       --restart unless-stopped \
       $LINKS \
       $IMAGE

echo "http://localhost:$WWW_PORT  $CONTAINER"
