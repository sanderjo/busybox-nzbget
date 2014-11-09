FROM progrium/busybox
MAINTAINER sanderjo <sanderjonkers+docker@gmail.com>

RUN	opkg-install curl

RUN 	cd / &&\
        mkdir nzbget &&\
        cd nzbget &&\
        curl --silent -L -k https://www.dropbox.com/s/dfq5z8tbsvuiwn5/nzbget?dl=0 -o nzbget &&\
        chmod +x nzbget

RUN	cd nzbget &&\
        curl --silent -L -k https://www.dropbox.com/s/574um0kl7wxeddb/nzbget.conf?dl=0 -o nzbget.conf

RUN 	cd nzbget &&\
        curl --silent -L -k https://www.dropbox.com/s/uehad0ure9f0dmm/webui-of-nzbget.tar.gz?dl=0 -o webui-of-nzbget.tar.gz &&\
        gunzip webui-of-nzbget.tar.gz &&\
        tar xvf webui-of-nzbget.tar &&\
        cp nzbget.conf webui

RUN	mkdir /root/downloads && mkdir /root/downloads/dst/

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





