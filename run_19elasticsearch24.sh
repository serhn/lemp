#!/bin/sh
. inc/init.sh
IMAGE=elasticsearch:2.4


ADD_LINKS="php56" 
check_link
#echo $LINKS

docker run  -d \
            --restart unless-stopped  \
            --name="$CONTAINER" \
            $LINKS \
            $IMAGE
