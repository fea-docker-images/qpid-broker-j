# Qpid Broker-J Docker image

This image provides the [Qpid Broker-J](https://qpid.apache.org/components/broker-j/index.html) server version `7.1.1`.

## Used Volumes

```
QPID_WORK=var/qpid-work
```

## Exposed Ports

```
5672 - default AMQP Port
5673 - configured to use AMQP 1.0 through Websockets (without SSL)
8080 - http port of the management web interface
```

## Additional Information

The image is built with `extended-config.json` which is a copy of the default, generated `config.json` of Qpid Broker-J and extended by port `5673` to accept AMQP 1.0 messages through a Websocket connection.