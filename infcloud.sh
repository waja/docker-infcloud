#!/usr/bin/env ash
[ ! -f /srv/infcloud/config/config.js ] && cp /srv/infcloud/config.js.orig /srv/infcloud/config/config.js; \
    lighttpd -D -f /etc/lighttpd/lighttpd.conf

