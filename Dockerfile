FROM alpine:3.7

# Dockerfile Maintainer
MAINTAINER Jan Wagner "waja@cyconet.org"

ENV VERSION  0.13.1

ADD lighttpd.conf /tmp/lighttpd.conf
ADD cache_update.sh /usr/local/bin/cache_update
ADD infcloud.sh /usr/local/bin/infcloud

RUN apk --no-cache add unzip wget ca-certificates lighttpd \
    && mv /etc/lighttpd/lighttpd.conf /etc/lighttpd/lighttpd.conf.apk-new \
    && mv /tmp/lighttpd.conf /etc/lighttpd/lighttpd.conf \
    && wget  https://www.inf-it.com/InfCloud_$VERSION.zip \
    && unzip InfCloud_*.zip -d /srv/ \
    && rm InfCloud_*.zip \
    && mkdir -p /srv/infcloud/config \
    && cp /srv/infcloud/config.js /srv/infcloud/config/config.js \
    && mv /srv/infcloud/config.js /srv/infcloud/config.js.orig \
    && mv /srv/infcloud/cache_update.sh /srv/infcloud/cache_update.sh.orig \
    && ln -s /srv/infcloud/config/config.js /srv/infcloud/config.js \
    && ln -s /usr/local/bin/cache_update /srv/infcloud/cache_update.sh \
    && chmod +x /usr/local/bin/infcloud /usr/local/bin/cache_update \
    && sync; /srv/infcloud/cache_update.sh \
    && apk del -rf --purge unzip wget ca-certificates

EXPOSE 80

ENTRYPOINT ["infcloud"]
