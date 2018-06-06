#!/bin/sh
. inc/init.sh
IMAGE=serh/docker-php71dev
. inc/check_container.sh
docker run  -d \
            --restart unless-stopped  \
            --name="$CONTAINER" \
            --link=mysql \
            --link=mailcatcher \
            -v ${NGINX_LOCAL_DIR}/sites:/usr/share/nginx \
            $IMAGE
