#!/bin/sh
. inc/init.sh
IMAGE=serh/docker-php56dev

ADD_LINKS="mysql56:mysql" 
check_link
#echo $LINKS

docker run  -d \
        --restart unless-stopped  \
        --name="$CONTAINER" \
        $LINKS \
            -v ${NGINX_LOCAL_DIR}/sites:/usr/share/nginx \
             $IMAGE
