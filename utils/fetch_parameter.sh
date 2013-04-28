#!/bin/bash

if [ ! -z $1 -a -f $1 -a ! -z $2 ]
then
	array=($(cat $1))
	for (( i=0;i<${#array[*]};i++ ))
	do
		full_line=${array[$i]}
		key=${full_line%=*}
		value=${full_line#*=}
		if [ $key == $2 ]
		then
			echo $value
		fi
	done
else
	echo "No config file found."
fi
