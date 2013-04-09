#!/bin/bash

curr_ip_full=$(curl http://ddns.oray.com/checkip)
curr_ip_r=${curr_ip_full##*:}
curr_ip=${curr_ip_r%%<*}
echo $curr_ip
