FROM php:7.2.2-apache
MAINTAINER Elad Bar <elad.bar@hotmail.com>

WORKDIR /app

COPY DahuaEventHandler.php ./DahuaVTO.php
COPY phpMQTT.php ./phpMQTT.php

RUN apk add --no-cache --update argon2-libs php php-json && \
apk add --no-cache --virtual .build-dependencies git && \
chmod +x /app/DahuaVTO.php && \
apk del .build-dependencies

CMD php -f /app/DahuaVTO.php
