FROM phusion/baseimage:0.9.17
MAINTAINER madsonic (support@madsonic.org)

# Package Information
ENV PKG_VER 6.0
ENV PKG_BUILD 7120
ENV PKG_DATE 20150827
ENV PKG_NAME madsonic

# set locale
RUN locale-gen en_US en_US.UTF-8

# force update & install requirements
RUN apt-get update
RUN apt-get -qqy --force-yes dist-upgrade
RUN apt-get install -qqy --force-yes wget default-jre-headless tail

# install deb package 
RUN wget http://madsonic.org/download/${PKG_VER}/${PKG_DATE}_${PKG_NAME}-${PKG_VER}.${PKG_BUILD}.deb 
RUN dpkg -i ${PKG_DATE}_${PKG_NAME}-${PKG_VER}.${PKG_BUILD}.deb

# RUN wget http://madsonic.org/download/6.0/20150725_madsonic-6.0.6890.deb
# RUN dpkg -i 20150725_madsonic-6.0.6890.deb

VOLUME /config /media

EXPOSE 4040 4050

ADD ./start.sh /start.sh
RUN chmod +x  /start.sh

ENTRYPOINT ["/start.sh"]
