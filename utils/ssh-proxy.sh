#!/bin/sh

password=$(/store/user_scripts/fetch_parameter.sh /etc/mypass ssh_password)
echo "password:$password"

function is_proxy_service_on(){
	netstat -tnl|grep -q $1
}

function start_service51(){
	sshpass -p $password ssh -qTfnN -D 0.0.0.0:7070 slackwareer@116.251.211.51 -p 22
}
function start_service_169(){
	echo "Starting....$0"
		sshpass -p $password ssh -qTfnN -D 0.0.0.0:7070 slackwareer@69.85.95.169 -p 22
}
function start_service(){
	sshpass -p $password ssh -qTfnN -D 0.0.0.0:7070 slackwareer@209.141.58.228 -p 22
}

function start_service_tmp(){
	sshpass -p $password ssh -qTfnN -D 0.0.0.0:7070 slackwareer@173.224.222.118 -p 22
}

function test_start_service(){
	sshpass -p test ssh -qTfnN -D 0.0.0.0:7070 test@173.224.222.118 -p 22
}
function start_service_18(){
	sshpass -p $password ssh -qTfnN -D 0.0.0.0:7070 slackwareer@147.255.127.18 -p 22
}
function stop_service(){
	kill -9 $1
}

PID=$(pidof ssh)
is_proxy_service_on 7070
if [ $? -eq 0  -a ! -z "$PID" ]
then 
	echo "Proxy Service is still on.."
else
	echo "Proxy Serice is down.Restarting..."
	start_service51
	if [ $? -eq 0 ]
	then 
		echo "Proxy Service restart succeed."
	else
		echo "Proxy Service restart failed."
	fi
fi
