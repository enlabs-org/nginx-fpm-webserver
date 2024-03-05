ARG NGINX_VERSION=1.25.4

FROM nginx:${NGINX_VERSION}

ENV NGINX_WEBROOT /var/www/html
ENV NGINX_FPM_HOST php
ENV NGINX_FPM_PORT 9000
ENV NGINX_FPM_INDEX index.php

COPY nginx/default.conf.template /etc/nginx/conf.d/default.conf.template

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
