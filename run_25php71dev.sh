#!/bin/sh
. inc/init.sh
IMAGE=serh/docker-php71dev



LINKS=" --link=mysql57:mysql --link=mailcatcher " 
#check_link
echo $LINKS

docker run  -d \
            --restart unless-stopped  \
            --name="$CONTAINER" \
            $LINKS \
            -e TZ=Europe/Kiev \
            -v ${NGINX_LOCAL_DIR}/sites:/usr/share/nginx \
            $IMAGE
