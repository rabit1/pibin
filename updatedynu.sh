#!/bin/bash 

#nowip=$(curl -s http://whatismyip.akamai.com)
nowip=$(wget -qO- http://ipecho.net/plain)
echo $nowip

#read -r lastip<currentip
lastip=$(resolveip -s big.dynu.com)
#echo "lastip: "
echo $lastip

if [ "$nowip" != "$lastip" ]
then
	echo "Not Same"
	wget "https://api.dynu.com/nic/update?hostname=big.dynu.com&myip="$nowip"&username=rabit1&password=rabit12"
	curl -s http://whatismyip.akamai.com > currentip
	# wget -qO- http://ipecho.net/plain
	# wget -qO- http://ipecho.net/plain > currentip
	date > /tmp/lastrun
	echo "Not Same" >> /tmp/lastrun
else
	echo "Same"
	date > /tmp/lastrun
	echo "Same" >> /tmp/lastrun
fi

rm -fr update?hostname*

