CONTAINER=$(echo $0 | sed 's#.*/run_[0-9]*\(.*\).sh$#\1#g')
LARAVEL_DIR="${PWD}/../"
PHP_VERSION=$(ls ${PWD} | grep -E "^run_[0-9]*(php[0-9]+)." | sed "s/run_[0-9]*\(php.*\).sh/\1/g")
NGINX_LOCAL_DIR="${PWD}/nginx"

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

ADD_LINKS=""

if [ "$(docker ps -q -f name=$CONTAINER)" ]; then
   docker stop  $CONTAINER
   docker rm  $CONTAINER
fi
