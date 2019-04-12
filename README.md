# Qpid Broker-J Docker image

This image provides the [Qpid Broker-J](https://qpid.apache.org/components/broker-j/index.html) server version `7.1.2`.

## Run with different initial configuration

To run the image with different parameters, just overwrite the the [ENTRYPOINT](https://docs.docker.com/engine/reference/run/#entrypoint-default-command-to-execute-at-runtime). For example add an initial configuration file:

```
docker run -v $(pwd):/myvolume fea17e86/qpid-broker-j --initial-config-path /myvoulme/initial-config.json
```

You can achieve the same in with `docker-compose`. Just add this to the service inside `docker-compose.yml`:

```
volumes:
  - .:/myvolume
command: --initial-config-path /myvolume/initial-config.json
```

Of course you will have to point to a path inside the container. You can for example create a new volume, like in the example above.