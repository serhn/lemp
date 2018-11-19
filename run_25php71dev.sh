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
            -v ${NGINX_LOCAL_DIR}/sites:/usr/share/nginx \
            $IMAGE
