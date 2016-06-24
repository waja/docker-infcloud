FROM alpine:3.4

# Dockerfile Maintainer
MAINTAINER Jan Wagner "waja@cyconet.org"

ENV VERSION  0.13.1

ADD lighttpd.conf /tmp/lighttpd.conf
ADD infcloud.sh /usr/local/bin/infcloud

RUN apk --no-cache add unzip wget ca-certificates lighttpd \
    && mv /etc/lighttpd/lighttpd.conf /etc/lighttpd/lighttpd.conf.apk-new \
    && wget  https://www.inf-it.com/InfCloud_$VERSION.zip \
    && unzip InfCloud_*.zip -d /srv/ \
    && rm InfCloud_*.zip \
    && mkdir -p /srv/infcloud/config \
    && cp /srv/infcloud/config.js /srv/infcloud/config/config.js \
    && mv /srv/infcloud/config.js /srv/infcloud/config.js.orig \
    && ln -s /srv/infcloud/config/config.js /srv/infcloud/config.js \
    && chmod +x /usr/local/bin/infcloud \
    && apk del -rf --purge unzip wget ca-certificates

EXPOSE 80

ENTRYPOINT ["infcloud"]
