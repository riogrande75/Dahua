FROM php:7.2.2-apache
MAINTAINER Elad Bar <elad.bar@hotmail.com>

WORKDIR /app

COPY DahuaEventHandler.php ./DahuaVTO.php
COPY phpMQTT.php ./phpMQTT.php

CMD php -f /app/DahuaVTO.php
