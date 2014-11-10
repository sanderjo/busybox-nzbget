busybox-nzbget
==============

A x86_64 docker image for NZBget on busybox. Total size is about 15 MB. And that is the goal of this docker image: provide a small image.

This is work in progress, as the to do is actually getting the downloaded stuff into the host ...

Create Image
------------
```
sudo docker build --no-cache -t sanderjo/busybox-nzbget .
```
Note: do not forget the . at the end of the line above!

Run Image
---------
```
sudo docker run -p 6789:6789 -it sanderjo/busybox-nzbget
```

Start nzbget in the docker image
--------------------------------
Inside the docker container, on the prompt type something like:
```
/nzbget/nzbget -D -c /nzbget/nzbget.conf --option WebDir=/nzbget/webui \
-o server1.name=newsreader3.eweka.nl -o server1.host=newsreader3.eweka.nl \
-o server1.username=blabla -o server1.password=blabla
```
