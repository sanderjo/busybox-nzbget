busybox-nzbget
==============

A x86_64 docker image for NZBget on busybox. Total size is about 15 MB. And that is the goal of this docker image: provide a small image.

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

Access NZBget
-------------
Access NZBget via http://127.0.0.1:6789/nzbget:tegbzn6789/

Go to Settings -> NEWS-SERVERS and fill out at least one newsserver. Click on "Save All Changes" and then on Restart NZBget.


