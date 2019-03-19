# zmq4-arm
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/farshidtz/zmq4-arm.svg)](https://hub.docker.com/r/farshidtz/zmq4-arm) [![Build Status](https://travis-ci.org/farshidtz/zmq4-arm.svg?branch=master)](https://travis-ci.org/farshidtz/zmq4-arm)

armhf cross-compilation with static linking for [github.com/pebbe/zmq4](https://github.com/pebbe/zmq4). Fork and modify the Dockerfile for your own needs.

### Usage
The container executes `go build` from `/home` in ENTRYPOINT. Other build options should be passed to `go build` as the [docker run command](https://docs.docker.com/engine/reference/run/#cmd-default-command-or-options).


Run with source codes mounted to container's `/home` directory:
```
docker run --rm -v /path/to/src:/home farshidtz/zmq4-arm [GO BUILD OPTIONS]
```

Example:
```
docker run --rm -v $(pwd):/home farshidtz/zmq4-arm -o bin/app ./package
```
builds the package in `package` directory and outputs the executable to `bin/app` relative to current directory on host.
