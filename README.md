# DahuaVTO2MQTT

## Description
Listens to events from Dahua VTO unit and publishes them via MQTT Message

## Credits
All credits goes to <a href="https://github.com/riogrande75">@riogrande75</a> who wrote that complicated integration
Original code can be found in <a href="https://github.com/riogrande75/Dahua">@riogrande75/Dahua</a>

## Change-log
2020-Feb-03 - Initial version combing the event listener with MQTT

## Environment Variables
```
DAHUA_VTO_HOST: 		Dahua VTO hostname or IP
DAHUA_VTO_USERNAME: 	Dahua VTO username to access (should be admin)
DAHUA_VTO_PASSWORD: 	Dahua VTO administrator password (same as accessing web management)
MQTT_BROKER_HOST: 		MQTT Broker hostname or IP
MQTT_BROKER_PORT: 		MQTT Broker port, default=1883
MQTT_BROKER_USERNAME: 	MQTT Broker username
MQTT_BROKER_PASSWORD: 	MQTT Broker password
MQTT_BROKER_TOPIC: 		Topic to publish all events, default=DahuaVTO/Events
```

## Run manually
Requirements:
* All environment variables above
* PHP

```
php -f DahuaEventHandler.php
```

## Docker Compose
```
version: '2'
services:
  dahuavto2mqtt:
    image: "eladbar/dahuavto2mqtt:latest"
    container_name: "dahuavto2mqtt"
    hostname: "dahuavto2mqtt"
    restart: always
    environment:
      - DAHUA_VTO_HOST=vto-host
      - DAHUA_VTO_USERNAME=Username
      - DAHUA_VTO_PASSWORD=Password
      - MQTT_BROKER_HOST=mqtt-host
      - MQTT_BROKER_PORT=1883
      - MQTT_BROKER_USERNAME=Username
      - MQTT_BROKER_PASSWORD=Password
      - MQTT_BROKER_TOPIC=DahuaVTO/Events	  
```

## MQTT Message (Dahua VTO Event Payload)
Message with more than one event can take place by subscription,
By default each message should be with one event in the list.

#### Events (With dedicated additional data)
```
CallNoAnswered: Call from VTO

IgnoreInvite: VTH answered call from VTO

VideoMotion: Video motion detected

RtspSessionDisconnect: Rtsp-Session connection connection state changed
	Action: Represented whether event Start or Stop
	Data.Device: IP of the device connected / disconnected
	
BackKeyLight: BackKeyLight with State
	Data.State: Represents the new state

TimeChange: Time changed
	Data.BeforeModifyTime: Time before change
	Data.ModifiedTime: Time after change

NTPAdjustTime: NTP Adjusted time
	Data.result: Whether the action succesded or not
	Data.Address: URL of the NTP

KeepLightOn: Keep light state changed
	Data.Status: Repesents whether the state changed to On or Off
	
VideoBlind: Video got blind state changed
	Action: Represented whether event Start or Stop

FingerPrintCheck: Finger print check status
	Data.FingerPrintID: Finger print ID, if 0, check failed

SIPRegisterResult: SIP Device registration status
	Action: Should be Pulse
	Data.Success: Whether the registration completed or failed

AccessControl: Someone opened the door
	Data.Name: ?
	Data.Method
		4=Remote/WebIf/SIPext
		6=FingerPrint
	Data.UserID: By FingerprintManager / Room Number / SIPext
	Data.ReaderId: ?

CallSnap: Call
	Data.DeviceType: Which device type
	Data.RemoteID: UserID
	Data.RemoteIP: IP of VTH / SIP device
	Data.ChannelStates: Status

Invite - Invite for a call (calling)
	Action: ?
	Data.CallID: Call ID
	Data.LockNum: ?
	
AccessSnap: ?
	Data.FtpUrl: FTP uploaded to

RequestCallState: ? 
	Action: ?
	Data.LocaleTime: Date and time of the event
	Data.Index: Index of the call

PassiveHungup: Call was dropped
	Action 
	Data.LocaleTime: Date and time of the event
	Data.Index: Index of the call

ProfileAlarmTransmit: Alarm triggered
	Action: ?
	Data.AlarmType: Alarm type
	Data.DevSrcType: Device triggered the alarm
	Data.SenseMethod: What triggered the alarm
```

#### Structure
```
{
	"id": [MESSAGE ID],
	"method":"client.notifyEventStream",
	"params":{
		"SID":513,
		"eventList":[
			{
				"Action":"[EVENT ACTION]",
				"Code":"[EVENT NAME]",
				"Data":{
					"LocaleTime":"YYYY-MM-DD HH:mm:SS",
					"UTC": [EPOCH TIMESTAMP]
				},
				"Index": [EVENT ID IN MESSAGE],
				"Param":[]
			}
		]
	},
	"session": [SESSION IDENTIFIER]
}
```
