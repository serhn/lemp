#!/bin/sh
. inc/init.sh
IMAGE=serh/docker-php72

docker run  -d \
            --restart unless-stopped  \
            --name="$CONTAINER" \
            --link mysql57:mysql \
            --link redis \
            -e TZ=Europe/Kiev \
            -v ${PWD}/inc/php72.ini:/usr/local/etc/php/php.ini \
            -v ${NGINX_LOCAL_DIR}/sites:/usr/share/nginx \
            $IMAGE
