#!/bin/bash

###author slackwareer

function break_dir(){
	ls -a $1|grep -q .svn
	if [[ $? -eq 0 ]]
	then
	echo "deleting $1/.svn..."
	rm -rf $1/.svn 
	fi
	for dir in $(ls $1)
		do
	if [[ -d $1/$dir ]]
	then
		break_dir $1/$dir
	fi
	done
}
function help(){
	echo "Wrong parameter..."
	echo "Usage:$0 dir"
}
if [[ $# -lt 1 ]]
then 
help
exit 1
fi
break_dir $1
