#!/bin/sh
. inc/init.sh

ls run_*.sh | while read line; do
	CUR_SCRIPT=$(echo $line | sed "s/.*run_[0-9]*\(.*\).sh/\\1/g")
	CHECK_IGNORE=$(cat ./inc/ignore_container | grep "^${CUR_SCRIPT}$" | wc -l)
	if [ "$CHECK_IGNORE" -eq "0" ]; then
		echo "${GREEN}RUN${NC}   	./$line"
		./$line
	else
		echo "${RED}IGNORE${NC}	./$line"
	fi

done
