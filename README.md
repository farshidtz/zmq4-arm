# zmq4-arm
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/farshidtz/zmq4-arm.svg)](https://hub.docker.com/r/farshidtz/zmq4-arm)


armhf cross-compilation toolchain for [github.com/pebbe/zmq4](https://github.com/pebbe/zmq4)

### Usage
The container executes `go build` from `/home` in ENTRYPOINT. Other build options should be passed to `go build` as the [docker run command](https://docs.docker.com/engine/reference/run/#cmd-default-command-or-options).
#### Clone / prepare the Go package
```
git clone <repo>
```
#### Build using the container
Note: `GO111MODULE` is set to `on`
```
docker run --rm -v $(pwd):/home farshidtz/zmq4-arm [GO BUILD OPTIONS]
```

Example:
```
docker run --rm -v $(pwd):/home farshidtz/zmq4-arm -o bin/app ./package
```
builds the package in package directory and outputs the executable to /home/bin/app