#!/bin/sh
. inc/init.sh
IMAGE=serh/docker-php72dev
#. inc/check_container.sh

ADD_LINKS="mysql57:mysql mailcatcher memcached" 
#check_link
#echo $LINKS
docker run  -d \
            --restart unless-stopped  \
            --name="$CONTAINER" \
            -p 35729:35729 \
            -e TZ=Europe/Kiev \
            $LINKS \
            -v ${NGINX_LOCAL_DIR}/sites:/usr/share/nginx \
            $IMAGE
