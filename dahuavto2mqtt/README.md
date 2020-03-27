# Hass.io Add-on: Dahua Intercom to MQTT Gateway

Sends Dahua Intercome events to the MQTT Gateway

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

## Installation

The installation of this add-on is straightforward and easy to do.

1. Navigate in your Home Assistant frontend to **Hass.io** -> **Add-on Store**.
2. Add a new repository by URL `https://github.com/elad-bar/Hassio-addons`
3. Find the "DahuaVTO2MQTT" add-on and click it.
4. Click on the "INSTALL" button.

## How to use

To use this add-on, you need to supply the config for your intercom and MQTT gateway

- Requires you to use one of the supported Dahua Intercoms
- Requires you to run a local MQTT server
- [MQTT Event's][mqtt-events]


## Configuration

Add-on configuration:

```json
{
    "intercom": {
      "host": "192.168.1.110",
      "username": "admin",
      "password": "admin"
    },
    "mqtt": {
      "host": "core-mosquitto",
      "port": "1883",
      "username": "homeassistant",
      "password": "homeassistant"
    }
  }
```

## Known issues and limitations

- None. Let me know.

## Credits
Using [riogrande75's][original-author] PHP code that connects your intercom and publishes events via MQTT broker.
Thanks to [troykelly's][original-addon-author], I created that Hass.io addon.

## Support

Got questions?

You have several options to get them answered:
- The Home Assistant [Community Forum][forum].

In case you've found a bug, please [open an issue on our GitHub][issue].

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[forum]: https://community.home-assistant.io
[issue]: https://github.com/elad-bar/Hassio-addons/issues
[source-shield]: https://img.shields.io/badge/version-master-blue.svg
[source]: https://github.com/elad-bar/Dahua/tree/master
[original-author]: https://github.com/riogrande75/Dahua
[original-addon-author]: https://github.com/troykelly/
[mqtt-events]: https://github.com/elad-bar/Hassio-addons/blob/master/dahuavto2mqtt/Events.md
