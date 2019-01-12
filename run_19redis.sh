#!/bin/sh
. inc/init.sh
IMAGE=redis


#ADD_LINKS="memcache php56" 
ADD_LINKS="" 
#check_link
echo $LINKS

docker run  -d \
            --restart unless-stopped  \
            --name="redis-cache" \
            $LINKS \
            $IMAGE
