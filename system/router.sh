#!/bin/bash

sysctl -w net.ipv4.ip_forward=1
ifconfig wlan0 up 10.0.0.1 netmask 255.255.255.0 
systemctl restart hostapd

iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables --table nat --append POSTROUTING --out-interface ppp0 -j MASQUERADE
iptables --append FORWARD --in-interface wlan0 -j ACCEPT

##为啥用这个？？？
#iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 80 -j REDIRECT --to-port 3128
iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 80 -j DNAT --to 10.0.0.1:3128

systemctl restart squid

echo "router started"
