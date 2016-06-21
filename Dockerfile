FROM alpine:latest

# Dockerfile Maintainer
MAINTAINER Jan Wagner "waja@cyconet.org"

ENV VERSION  0.13.1

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf
ADD infcloud.sh /usr/local/bin/infcloud

RUN apk --no-cache add unzip wget ca-certificates lighttpd \
    && wget  https://www.inf-it.com/InfCloud_$VERSION.zip \
    && unzip InfCloud_*.zip -d /srv/ \
    && rm InfCloud_*.zip \
    && cp -a /srv/infcloud/config.js /srv/infcloud/config.js.orig
    && chmod +x /usr/local/bin/infcloud \
    && apk del -rf --purge unzip wget ca-certificates

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf
ADD baikal.sh /usr/local/bin/baikal

VOLUME /srv/infcloud/config.js

EXPOSE 80

ENTRYPOINT ["infcloud"]
