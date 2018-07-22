#!/bin/sh
. inc/init.sh
IMAGE="phpmyadmin/phpmyadmin"
. inc/check_container.sh

ADD_LINKS="mysql57:db" 
check_link
#echo $LINKS

docker run -d \
           -p 8080:80 \
          --name $CONTAINER \
       --restart unless-stopped \
       $LINKS \
       $IMAGE
