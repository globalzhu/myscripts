#!/bin/bash


cmd=$(cat remote-script/flush-iptables.sh)
echo $cmd

password=$(fetch_parameter.sh password password)
sshpass -p $password ssh root@192.168.1.1 "$cmd"
