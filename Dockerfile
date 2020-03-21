ARG BUILD_FROM
FROM $BUILD_FROM

MAINTAINER Elad Bar <elad.bar@hotmail.com>

WORKDIR /app

COPY DahuaEventHandler.php ./DahuaVTO.php
COPY phpMQTT.php ./phpMQTT.php

ENV DAHUA_VTO_HOST=vto-host
ENV DAHUA_VTO_USERNAME=Username
ENV DAHUA_VTO_PASSWORD=Password
ENV MQTT_BROKER_HOST=mqtt-host
ENV MQTT_BROKER_PORT=1883
ENV MQTT_BROKER_USERNAME=Username
ENV MQTT_BROKER_PASSWORD=Password

RUN apk add --no-cache --update argon2-libs php php-json && \
apk add --no-cache --virtual .build-dependencies git && \
chmod +x /app/DahuaVTO.php && \
apk del .build-dependencies

COPY data/run.sh .
CMD ./run.sh