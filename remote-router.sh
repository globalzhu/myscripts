#!/bin/bash


cmd=$(cat /store/user_scripts/remote-script/flush-iptables.sh)
echo $cmd

password=$(/store/user_scripts/utils/fetch_parameter.sh /etc/mypass password)
echo "password:$password"
sshpass -p $password ssh root@192.168.1.1 "$cmd"
