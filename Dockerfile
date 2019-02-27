FROM golang:1.12

ARG ZEROMQ_VER=4.3.1

RUN apt update && \
    apt install -y gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf binutils-arm-linux-gnueabi
# golang image already includes gcc g++ make pkg-config git

WORKDIR /home

ADD https://github.com/zeromq/libzmq/releases/download/v${ZEROMQ_VER}/zeromq-${ZEROMQ_VER}.tar.gz .
RUN tar xf zeromq-${ZEROMQ_VER}.tar.gz
RUN rm zeromq-${ZEROMQ_VER}.tar.gz

WORKDIR zeromq-${ZEROMQ_VER}
RUN ./configure --host=arm-none-linux-gnueabihf CC=arm-linux-gnueabihf-gcc CXX=arm-linux-gnueabihf-g++
RUN make
RUN make install