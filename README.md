# zmq4-arm
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/farshidtz/zmq4-arm.svg)](https://hub.docker.com/r/farshidtz/zmq4-arm)


armhf cross-compilation toolchain for [github.com/pebbe/zmq4](https://github.com/pebbe/zmq4)

### Usage
The container executes `go install` from `/home/project` in ENTRYPOINT. The package name should be passed as the [docker run command](https://docs.docker.com/engine/reference/run/#cmd-default-command-or-options).
#### Clone / prepare the Go package
```
git clone <repo> src/<package-name>
```
#### Build using the container
```
docker run --rm -v $(pwd):/home/project farshidtz/zmq4-arm <package-name>
```
The resulting executable will be available in `$(pwd)/bin`
