#!/bin/sh
. inc/init.sh
IMAGE=serh/docker-php71
LINKS=" --link=mysql57:mysql" 
#echo $LINKS

docker run  -d \
            --restart unless-stopped  \
            --name="$CONTAINER" \
            $LINKS \
            -v ${NGINX_LOCAL_DIR}/sites:/usr/share/nginx \
             $IMAGE
