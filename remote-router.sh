#!/bin/bash


cmd=$(cat remote-script/flush-iptables.sh)
echo $cmd

sshpass -p 330953127 ssh root@192.168.1.1 "$cmd"
