#!/bin/sh
. inc/init.sh
IMAGE=memcached


#ADD_LINKS="memcache php56" 
ADD_LINKS="" 
check_link
echo $LINKS

docker run  -d \
            --restart unless-stopped  \
            --name="$CONTAINER" \
            $LINKS \
            $IMAGE
