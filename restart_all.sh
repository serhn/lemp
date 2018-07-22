#!/bin/sh
Red='\033[0;31m'   # Red
Green='\033[0;32m' # Green

ls run_*.sh | while read line; do
	CUR_SCRIPT=$(echo $line | sed "s/.*run_[0-9]*\(.*\).sh/\\1/g")
	CHECK_IGNORE=$(cat ./inc/ignore_container | grep "^${CUR_SCRIPT}$" | wc -l)
	if [ "$CHECK_IGNORE" -eq "0" ]; then
		echo "\033[32mRUN\033[0m   	./$line"
		./$line
	else
		echo "\033[31mIGNORE\033[0m	./$line"
	fi

done
