busybox-nzbget
==============

A x86_64 docker image for NZBget on busybox. Total size is about 15 MB. And that is the goal of this docker image: provide a small image.


Create Image
------------
```
sudo docker build --no-cache -t sanderjo/busybox-nzbget .
```
Note: do not forget the . at the end of the line above!

Preparation
-----------
```
mkdir ~/nzbget-data/
mkdir ~/nzbget-config
```

Run Image
---------
```
sudo docker run -d -p 6789:6789 -v ~/nzbget-config:/config -v ~/nzbget-data:/data  sanderjo/busybox-nzbget
```

Access NZBget
-------------
Access NZBget via http://127.0.0.1:6789/nzbget:tegbzn6789/
Fill out 

