#!/usr/bin/env ash
[ ! -f /srv/infcloud/config/config.js ] && cp /srv/infcloud/config.js.orig /srv/infcloud/config/config.js; \
/srv/infcloud/cache_update.sh; \
[ ! -f /etc/lighttpd/lighttpd.conf ] && cp /tmp/lighttpd.conf /etc/lighttpd/lighttpd.conf; \
    lighttpd -D -f /etc/lighttpd/lighttpd.conf

