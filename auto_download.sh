#!/bin/bash
#===============================================================================
#
#          FILE:  auto_download.sh
# 
#         USAGE:  ./auto_download.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  TimeBreaker (), slackwareer@gmil.com
#       COMPANY:  slackwareer.f3322.org
#       VERSION:  1.0
#       CREATED:  2013年01月23日 11时34分04秒 CST
#      REVISION:  ---
#===============================================================================


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
	lixian_cli download $1 && lixian_cli delete $1
	size 100
}    
function size(){
	cat downloaded_list|head -100 > downloaded_list
}
cd /store/movie

lixian_cli list | while read line; 
do echo $line|grep -q completed; 
if [ $? -eq 0 ] 
then
do_completed $line
else
echo "$line not completed."
fi 
done
