#!/bin/bash


cmd=$(cat /store/user_scripts/remote-script/flush-iptables.sh)
echo $cmd

password=$(fetch_parameter.sh /store/user_scripts/password password)
sshpass -p $password ssh root@192.168.1.1 "$cmd"
