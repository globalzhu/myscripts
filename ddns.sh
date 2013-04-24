#!/bin/sh

# written by ywj
ipaddr=$( echo `wget -q -O- http://www.3322.org/dyndns/getip`)
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

update_url="http://[USERNAME]:[PASSWORD]@members.3322.org/dyndns/update?system=dyndns&hostname=[DOMAIN]&myip=[IP]"

username=$(fetch_parameter.sh /etc/mypass username)
password=$(fetch_parameter.sh /etc/mypass password)
#change username
update_url=$(echo $update_url | sed s/"\[USERNAME\]"/"$username"/g)
#change password
update_url=$(echo $update_url | sed s/"\[PASSWORD\]"/"$password"/g)
#change domain
update_url=$(echo $update_url | sed s/"\[DOMAIN\]"/"slackwareer.f3322.org"/g)
#change ipaddr
update_url=$(echo $update_url | sed s/"\[IP\]"/"$ipaddr"/g)  
#delete ""
update_url=$(echo $update_url | sed s/"\""/""/g)  
#update  ipaddr 
echo "wget -q -O- $update_url" 

wget -q -O- $update_url

echo "Finished.."
