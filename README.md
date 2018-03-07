# MQTT Demo

```
% brew install mosquitto
```

## Demo

```iex
iex(1)>  c1 = MqttDemo.make_client("c1")
iex(2)>  MqttDemo.subscribe(c1, ["topic/state"], [0])
:ok
[
  message: %Hulaaki.Message.SubAck{granted_qoses: [0], id: 1, type: :SUBACK},
  state: %{
    connection: #PID<0.159.0>,
    keep_alive_interval: 100000,
    keep_alive_timer_ref: #Reference<0.901046521.2424307718.158501>,
    packet_id: 2,
    ping_response_timeout_interval: 200000,
    ping_response_timer_ref: nil
  }
]
```

In another window:

```
% mqtt_demo - master! ❯ mosquitto_pub -t topic/state -m "Hello World"r
```

In `iex`, the following message gets logged:

```
[
  message: %Hulaaki.Message.Publish{
    dup: 0,
    id: nil,
    message: "ohai",
    qos: 0,
    retain: 1,
    topic: "topic/state",
    type: :PUBLISH
  },
  state: %{
    connection: #PID<0.159.0>,
    keep_alive_interval: 100000,
    keep_alive_timer_ref: #Reference<0.901046521.2424307718.158501>,
    packet_id: 2,
    ping_response_timeout_interval: 200000,
    ping_response_timer_ref: nil
  }
]
```

Similarly, you can publish. First, create a subscriber:

```
% mosquitto_sub -t topic/state
```

Then: 

```
iex(4)> MqttDemo.publish(c1, "topic/state", "ohai")
:ok
```

Observe that `ohai` gets printed.
