CONTAINER=$(echo $0 | sed 's#.*/run_[0-9]*\(.*\).sh$#\1#g')
NGINX_LOCAL_DIR="${PWD}/nginx"
PHP_VERSION=$(ls ${PWD} | grep -E "^run_[0-9]*(php[0-9]+)." | sed "s/run_[0-9]*\(php.*\).sh/\1/g")
ADD_LINKS=""
check_link() {
	#echo $ADD_LINKS
	#LINKS=""
	#cat ./inc/ignore_container
	LINKS=$(echo "$ADD_LINKS" | tr ' ' '\n' | {
		while read line_read; do
            line=`echo $line_read | sed -e "s/:.*$//g"`
			if [ -z "$line" ]; then
				continue
			fi
			if [ -f ./inc/ignore_container ]; then

				CHECK_IGNORE=$(cat ./inc/ignore_container | grep "^${line}$" | wc -l)
				if [ "$CHECK_IGNORE" -eq "0" ]; then
					LINKS=" ${LINKS} --link=${line_read} "
				fi
			else
				LINKS=" ${LINKS} --link=${line_read} "
			fi
		done
		echo $LINKS
	})
}
