#!/bin/sh
. inc/init.sh
IMAGE=serh/docker-php72

ADD_LINKS="mysql57:mysql" 
#echo $LINKS
docker run  -d \
            --restart unless-stopped  \
            --name="$CONTAINER" \
            $LINKS \
            -e TZ=Europe/Kiev \
            -v ${NGINX_LOCAL_DIR}/sites:/usr/share/nginx \
            $IMAGE
