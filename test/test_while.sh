#!/bin/bash

num=1;
while ((num<10))
do
	echo $num
	((num++))
done

while [[ $num > 0 ]]
do
	echo $num
	((num--))
done

while [ $num -lt 10 ]
do
	echo $num
	((num++))
done
