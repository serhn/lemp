#!/bin/sh
. inc/init.sh
IMAGE=yfix/sphinxsearch
. inc/check_container.sh




LINKS=" --link=mysql56:mysqlhost "

docker run  -d \
           -v $PATH_DOCKER/sphinx:/documents \
            --restart unless-stopped  \
            --name="$CONTAINER" \
	    -v $PATH_DOCKER/../aquasant/:/home/aqua/web/aquaweb.supportit.ru/aquasant/ \
	    -v $PATH_DOCKER/../aquasant/module/SoloSearch/config/sphinx/sphinx.conf:/etc/sphinxsearch/sphinx.conf \
	    $LINKS \
	    -p 9306:9306 \
            $IMAGE
docker exec $CONTAINER bash -c "/usr/bin/searchd -c /home/aqua/web/aquaweb.supportit.ru/aquasant/module/SoloSearch/config/sphinx/sphinx.conf"

