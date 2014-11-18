FROM progrium/busybox
MAINTAINER sanderjo <sanderjonkers+docker@gmail.com>

# create image (don't forget the . at the end of the line):
# sudo docker build --no-cache -t sanderjo/busybox-nzbget .

# run image in a container
# sudo docker run -p 6789:6789 -it sanderjo/busybox-nzbget

RUN	opkg-install curl

RUN 	cd / &&\
        mkdir nzbget &&\
        cd /nzbget &&\
        curl --silent -L -k https://www.dropbox.com/s/dfq5z8tbsvuiwn5/nzbget?dl=0 -o nzbget &&\
        chmod +x nzbget

RUN	cd /nzbget &&\
        curl --silent -L -k https://www.dropbox.com/s/574um0kl7wxeddb/nzbget.conf?dl=0 -o nzbget.conf.ORG

RUN	mkdir /data #&&\
	#mv nzbget.conf /data/nzbget.conf

RUN	mkdir /config


RUN 	cd /nzbget &&\
        curl --silent -L -k https://www.dropbox.com/s/uehad0ure9f0dmm/webui-of-nzbget.tar.gz?dl=0 -o webui-of-nzbget.tar.gz &&\
        gunzip webui-of-nzbget.tar.gz &&\
        tar xvf webui-of-nzbget.tar &&\
        cp nzbget.conf.ORG webui/nzbget.conf

RUN	mkdir /root/downloads && mkdir /root/downloads/dst/ 		
### ... is the above still needed?

RUN	cd /usr/lib/  &&\
        curl --silent -L -k  https://www.dropbox.com/s/c0xk6xr24z6fwe2/libs-for-nzbget.tar.gz?dl=0 -o libs-for-nzbget.tar.gz &&\
        gunzip libs-for-nzbget.tar.gz  &&\
        tar xvf libs-for-nzbget.tar &&\
        rm libs-for-nzbget.tar

RUN	cd /nzbget &&\
        curl --silent -L -k https://www.dropbox.com/s/dezlaogo44boe7y/unrar?dl=0 -o unrar &&\
        mv unrar /usr/bin/ &&\
        chmod +x /usr/bin/unrar

EXPOSE 6789

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

CMD ["/start.sh"]


# Then, access it using your webbrowser via http://127.0.0.1:6789/nzbget:tegbzn6789/







