#!/usr/bin/env bashio

export DAHUA_VTO_HOST=$(bashio::config 'intercom.host')
export DAHUA_VTO_USERNAME=$(bashio::config 'intercom.username')
export DAHUA_VTO_PASSWORD=$(bashio::config 'intercom.password')
export MQTT_BROKER_HOST=$(bashio::config 'mqtt.host')
export MQTT_BROKER_PORT=$(bashio::config 'mqtt.port')
export MQTT_BROKER_USERNAME=$(bashio::config 'mqtt.username')
export MQTT_BROKER_PASSWORD=$(bashio::config 'mqtt.password')
export MQTT_BROKER_TOPIC_PREFIX=$(bashio::config 'mqtt.topic_prefix')

bashio::log.info "Staring Dahua to MQTT"
bashio::log.debug "Connecting to Intercom ${DAHUA_VTO_HOST} with username ${DAHUA_VTO_USERNAME}"
bashio::log.debug "Connecting to Broker ${MQTT_BROKER_HOST} with username ${MQTT_BROKER_USERNAME}, Topic prefix: ${MQTT_BROKER_TOPIC_PREFIX}"
php -f ./DahuaVTO.php
bashio::log.info "Finished Dahua to MQTT"