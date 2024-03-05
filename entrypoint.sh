#!/usr/bin/env sh
set -eu

envsubst '${NGINX_WEBROOT} ${NGINX_FPM_HOST} ${NGINX_FPM_PORT} ${NGINX_FPM_INDEX}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"
