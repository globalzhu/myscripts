#!/bin/bash

function help(){
	echo "$0 "
}
if [[ $# != 3 ]]
then
	echo "Wrong parameter."
	help
fi

last_key=""

cat task.txt|while read line
do
	key=$(echo $line|awk -F ',' '{print $2}')	
	if [[ $last_key == $key ]]
	then
		echo $line	
	fi
	last_key=$key
done
