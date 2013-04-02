#!/bin/bash

free=`free -m|grep Mem`

total=`echo $free|awk '{print $2}'`
free_mem=`echo $free|awk '{print $4}'`
buffered_mem=`echo $free|awk '{print $6}'`
cached_mem=`echo $free|awk '{print $7}'`
echo "|$free_mem,$buffered_mem,$cached_mem|"
