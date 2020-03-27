ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

WORKDIR /app

COPY DahuaEventHandler.php ./DahuaVTO.php
COPY phpMQTT.php ./phpMQTT.php
COPY run.sh .

RUN apk add --no-cache --update argon2-libs php php-json && \
apk add --no-cache --virtual .build-dependencies git && \
chmod +x /app/DahuaVTO.php && \
chmod +x /app/run.sh && \
apk del .build-dependencies

CMD ./run.sh
