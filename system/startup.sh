#!/bin/bash
password=$(fetch_parameter.sh /etc/mypass password)
echo $password | sudo -S /store/user_scripts/system/cpu_freq.sh
echo $password | sudo -S /store/user_scripts/system/ntp.sh
echo $password | sudo -S /store/user_scripts/system/router.sh
