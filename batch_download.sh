#!/bin/bash

function help(){
	echo "$0 file column"
}

lixian_clear.sh

if [[ $# != 2 ]]
then
echo "Wrong parameter."
exit 1
fi
link_file=$1
column_num=$2
for links in $(cat $link_file)
do
	link=$(echo $links|awk '{print $column_num}')
	echo "Downloading link-->$link"
	lixian_add.sh $link
done

auto_download.sh
