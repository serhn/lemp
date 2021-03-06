#!/bin/sh
. inc/init.sh
IMAGE="nginx"
#if [ ! -d $NGINX_LOCAL_DIR/conf.d ]; then
#	mkdir $NGINX_LOCAL_DIR
#	docker run --name="$CONTAINER" -d -p 80:80 $IMAGE
#	docker cp $CONTAINER:/etc/nginx/conf.d ${NGINX_LOCAL_DIR}/conf.d
#	if [ ! -d ${NGINX_LOCAL_DIR}/sites ]; then
#		mkdir -p ${NGINX_LOCAL_DIR}/sites
#	fi
#	docker cp $CONTAINER:/usr/share/nginx/html ${NGINX_LOCAL_DIR}/sites/
#	docker stop $CONTAINER
#	docker rm $CONTAINER
#fi



ADD_LINKS="$PHP_VERSION" 
#ADD_LINKS="php56  php71  php71dev  php72dev" 
#echo $PHP_VERSION
#check_link
# TMP LINKS
#php56 php71 php71dev php72dev
#LINKS=" --link=php71 --link=php72dev --link=php72  --link=php71dev" 
LINKS=" --link=php71 --link=php72dev --link=php72  --link=php71dev" 
#LINKS=" --link=php71dev --link=php72dev --link=php72" 
echo $LINKS
#echo $LINKS

docker run  -itd \
	--restart unless-stopped \
	-v ${NGINX_LOCAL_DIR}/sites:/usr/share/nginx \
	-v ${NGINX_LOCAL_DIR}/conf.d:/etc/nginx/conf.d \
	-v ${NGINX_LOCAL_DIR}/log:/var/log/nginx \
	$LINKS \
        -e TZ=Europe/Kiev \
	--name="$CONTAINER" \
	-p 80:80 \
        $IMAGE
