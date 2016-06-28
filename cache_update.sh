#! /bin/sh
# Use this script every time you modify any file to force browsers to reload it (empty HTML5 cache).

command -v sed &> /dev/null || { echo "Error: 'sed' not installed. Aborting." > /dev/stderr; exit 1; }
sed -i "s/#V.*/#V $(date '+%Y%m%d%H%M%S')/" /srv/infcloud/cache.manifest
