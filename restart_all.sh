#!/bin/sh
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
check_ignore() {
	if [ -f ./inc/ignore_container ]; then
		while  read line1; do
			if [ "$line1" = "$CUR_SCRIPT" ]; then
				IGNORE="1"
			fi
		done < "./inc/ignore_container"

	fi
}

##exit

ls run_*.sh | while read line; do
	#	./$line
	IGNORE=0

	CUR_SCRIPT=$(echo $line | sed "s/.*run_[0-9]*\(.*\).sh/\\1/g")
	check_ignore
	if [ "$IGNORE" = "1" ]; then
		echo "\033[31mIGNORE\033[0m	./$line"
	else
		echo "\033[32mRUN\033[0m   	./$line"
		./$line
	fi

done
