#!/usr/bin/env ash
[ ! -f /srv/infcloud/config.js ] && cp /srv/infcloud/config.js.orig /srv/infcloud/config.js; \
#    chown -R lighttpd. /srv/infcloud && \
    lighttpd -D -f /etc/lighttpd/lighttpd.conf

