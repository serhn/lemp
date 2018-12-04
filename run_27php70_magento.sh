#!/bin/sh
CONTAINER="php70"
. inc/init.sh
IMAGE=serh/docker-php70-for-magento
docker run  -d \
            --restart unless-stopped  \
            --name="$CONTAINER" \
	    -e TZ="$TZ" \
            --link mysql56:db \
            -v ${PWD}/mag:/usr/share/nginx \
	    -v ${PWD}/inc/crontab:/etc/cron.d/crontab \
            -v ${PWD}/inc/php.ini:/usr/local/etc/php/php.ini \
            $IMAGE
#docker  exec -it ${CONTAINER} bash -c "/etc/init.d/cron start"
#docker  exec -it ${CONTAINER} bash -c "crontab -u root /etc/cron.d/crontab"
