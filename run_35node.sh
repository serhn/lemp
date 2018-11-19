#!/bin/sh
. inc/init.sh
IMAGE="node"



#php56 php71 php71dev php72dev
#LINKS="--link=mysql:mysql57" 
#echo $LINKS
#echo $LINKS

#	$LINKS \
docker run -it -d  \
	--restart unless-stopped \
	-v ${NGINX_LOCAL_DIR}/sites:/home/node \
	--name="$CONTAINER" \
	-p 3000:3000 $IMAGE
