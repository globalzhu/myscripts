#!/bin/bash

free=`free -m|grep Mem`

total=`echo $free|awk '{print $2}'`
free_mem=`echo $free|awk '{print $4}'`
buffered_mem=`echo $free|awk '{print $6}'`
cached_mem=`echo $free|awk '{print $7}'`
echo "$total=free:$free_mem,buffered:$buffered_mem,cached:$cached_mem"
