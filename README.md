# Qpid Broker-J Docker image

This image provides the [Qpid Broker-J](https://qpid.apache.org/components/broker-j/index.html) server version `7.1.1`. For this image, the default initial configuration of Broker-J, is copied to `QPID_INSTALL` path and used as `-icp (--initial-config-path)` for the execution of `qpid-server`.

## Build with different initial configuration

Just clone the repo, modify `initial-config.json` and build the image.

## Run with different initial configuration

To run the image, without having to rebuild it, with a different intial configuration, just overwrite the environment variable `INITIAL_CONFIG`:

```
docker run -v $(pwd):/myvolume -e INITIAL_CONFIG=/myvolume/amqp-ws-config.json qpid-broker-j
```

Of course you will have to point to a path inside the container. You can for example create a new volume, like in the example above.

## Ports (default initial-config.json)

```
5672 - default AMQP Port
8080 - http port of the management web interface
```