busybox-nzbget
==============

A x86_64 docker image for NZBget on busybox. Total size is about 15 MB. And that is the goal of this docker image: provide a small image.

This nzbget image is not capable of running python scripts.

Preparation
-----------
```
mkdir ~/nzbget-data/
mkdir ~/nzbget-config
```

Create Image
------------
```
sudo docker build --no-cache -t sanderjo/busybox-nzbget .
```
Note: do not forget the . at the end of the line above!



Run Image
---------
```
sudo docker run -d -p 6789:6789 -v ~/nzbget-config:/config -v ~/nzbget-data:/data  sanderjo/busybox-nzbget
```

Configure NZBget
-------------
Access NZBget via http://127.0.0.1:6789/nzbget:tegbzn6789/

Go to Settings -> NEWS-SERVERS and fill out at least one newsserver. Click on "Save All Changes" and then on "Reload NZBget."

Download NZBs
-------------
Via the NZBget webinterface and add a NZB. The result should appear in ~/nzbget/data/

Directories
-----------
Config directory, plus a bit of logging:
```
$ ls -al ~/nzbget-config/
total 168
drwxrwxr-x   2 sander sander  4096 nov 10 23:26 .
drwxr-xr-x 166 sander sander 20480 nov 10 23:23 ..
-rw-r--r--   1 root   root      60 nov 10 23:26 bootdate.txt
-rw-r--r--   1 root   root   66458 nov 10 23:31 nzbget.conf
-rw-r--r--   1 root   root   66192 nov 10 23:26 nzbget.conf.bak
```
Data directory:
```
$ ls -al ~/nzbget-data
total 48
drwxrwxr-x   7 sander sander  4096 nov 10 23:33 .
drwxr-xr-x 166 sander sander 20480 nov 10 23:23 ..
drwxr-xr-x   3 root   root    4096 nov 10 23:33 dst
drwxr-xr-x   2 root   root    4096 nov 10 23:33 inter
drwxr-xr-x   2 root   root    4096 nov 10 23:33 nzb
drwxr-xr-x   2 root   root    4096 nov 10 23:33 queue
drwxr-xr-x   2 root   root    4096 nov 10 23:33 tmp
```




