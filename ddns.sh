#!/bin/sh

# written by ywj
ipaddr=$(/store/user_scripts/get_ip.sh)
if [ -f /store/user_scripts/oldip ]
then
	oldip=`cat /store/user_scripts/oldip`
else
	oldip=""
fi
echo $ipaddr > /store/user_scripts/oldip


echo "new get public ip addr:$ipaddr"
echo "old public ip addr:$oldip"
if [ "$ipaddr" == "$oldip" ]
then 
echo "new ip is the same with the old ip so return"
exit
else
echo "new ip is not the same with the old ip continue"
fi


username=$(fetch_parameter.sh /etc/mypass username)
password=$(fetch_parameter.sh /etc/mypass password)
domain="slackwareer.f3322.org"

update_url="http://$username:$password@members.3322.org/dyndns/update?system=dyndns&hostname=$domain&myip=$ipaddr"

echo "wget -q -O- $update_url" 
wget -q -O- $update_url
echo "Finished.."
