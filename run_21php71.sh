#!/bin/sh
. inc/init.sh
IMAGE=serh/docker-php71

ADD_LINKS="mysql57:mysql" 
check_link
#echo $LINKS

docker run  -d \
            --restart unless-stopped  \
            --name="$CONTAINER" \
            $LINKS \
            -v ${NGINX_LOCAL_DIR}/sites:/usr/share/nginx \
             $IMAGE
