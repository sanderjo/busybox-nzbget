#! /bin/sh

date >> /config/bootdate.txt

if [ -e /config/nzbget.conf ]
then
   echo "Config file already exists" >> /config/bootdate.txt
else
   echo "Config file does not yet exist" >> /config/bootdate.txt
   cp /nzbget/nzbget.conf.ORG /config/nzbget.conf
   sed -i.bak -e 's/^MainDir.*/MainDir=\/data/g' /config/nzbget.conf
fi

/nzbget/nzbget -D -c /config/nzbget.conf --option WebDir=/nzbget/webui --option MainDir=/data/

#sleep 100
