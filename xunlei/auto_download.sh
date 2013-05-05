#!/bin/bash

function do_completed ()
{
	movie_name=`echo $line|awk '{printf $2}'`
	movie_id=`echo $line|awk '{printf $1}'`
	echo "checking movie:$movie_name"
	cat /store/movie/downloaded_list |grep -q $movie_id
	if [ ! $? -eq 0 ]
	then
		echo "$movie_name not downloaded,so download it..."
		download $movie_id
		echo $movie_id >> /store/movie/downloaded_list
	else
		echo "$movie_name downloaded!!!!!!!"
	fi
}    # ----------  end of function do_completed  ----------
function download ()
{
	/store/yaourt/xunlei-lixian-git/xunlei-lixian/lixian_cli.py download $1  
	/store/yaourt/xunlei-lixian-git/xunlei-lixian/lixian_cli.py delete $1
	size 100
}    
function size(){
	cat /store/movie/downloaded_list|head -100 > /tmp/.downloaded
	cat /tmp/.downloaded > /store/movie/downloaded_list
}

cd /store/movie
/store/yaourt/xunlei-lixian-git/xunlei-lixian/lixian_cli.py list | while read line; 
do echo $line|grep -q completed
if [ $? -eq 0 ] 
then
	do_completed $line
else
	echo "$line not completed."
fi 
done
