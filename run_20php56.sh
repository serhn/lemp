#!/bin/sh
. inc/init.sh
IMAGE=serh/docker-php56
. inc/check_container.sh
docker run  -d \
        --restart unless-stopped  \
        --name="$CONTAINER" \
        --link=mysql \
            -v ${NGINX_LOCAL_DIR}/sites:/usr/share/nginx \
             $IMAGE
