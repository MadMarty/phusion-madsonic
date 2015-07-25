FROM phusion/baseimage:0.9.17
MAINTAINER madsonic (support@madsonic.org)

# Package Information
ENV PKG_NAME madsonic
ENV PKG_VER 6.0
ENV PKG_BUILD 6890
ENV PKG_DATE 20150725

# set locale
RUN locale-gen en_US en_US.UTF-8

RUN apt-get update
RUN apt-get -qqy --force-yes dist-upgrade
RUN apt-get install -qqy --force-yes wget default-jre-headless

# download madsonic
RUN wget -O http://www.madsonic.org/download/${PKG_VER}/${PKG_DATE}_${PKG_NAME}-${PKG_VER}.${PKG_BUILD}.deb 
RUN dpkg -i ${PKG_VER}/${PKG_DATE}_${PKG_NAME}-${PKG_VER}.${PKG_BUILD}.deb

VOLUME /config /media

EXPOSE 4040 4050

ADD ./start.sh /start.sh
RUN chmod +x  /start.sh

ENTRYPOINT ["/start.sh"]
