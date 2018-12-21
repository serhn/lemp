#!/bin/sh
. inc/init.sh
IMAGE="node:8-jessie"



#php56 php71 php71dev php72dev
#LINKS="--link=mysql:mysql57" 
#echo $LINKS
#echo $LINKS

#	$LINKS \
docker run -it -d  \
	--restart unless-stopped \
	-v ${PWD}/../:/home/node \
	--name="$CONTAINER" \
	-p 3000:3000 \
	-p 8085:8800 \
	-p 35729:35729 $IMAGE
