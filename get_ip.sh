#!/bin/bash

http_ip=$(curl -qs http://ddns.oray.com/checkip)
ip=${http_ip##*:}
ip=${ip%%<*}
echo $ip
