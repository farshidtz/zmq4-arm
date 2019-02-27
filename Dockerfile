FROM golang:1.12

RUN apt update && \
    apt install -y gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf binutils-arm-linux-gnueabi
# golang image already includes gcc g++ make pkg-config git

WORKDIR /home

ARG ZEROMQ_VER=4.3.1
# Download and extract zeromq
ADD https://github.com/zeromq/libzmq/releases/download/v${ZEROMQ_VER}/zeromq-${ZEROMQ_VER}.tar.gz .
RUN tar xf zeromq-${ZEROMQ_VER}.tar.gz
RUN rm zeromq-${ZEROMQ_VER}.tar.gz
# Configure and install zeromq
WORKDIR zeromq-${ZEROMQ_VER}
RUN ./configure --host=arm-none-linux-gnueabihf CC=arm-linux-gnueabihf-gcc CXX=arm-linux-gnueabihf-g++
RUN make
RUN make install

ARG PROJECT_DIR=/home/project
# Setup the compilation environment
WORKDIR ${PROJECT_DIR}
ENV GOPATH=${PROJECT_DIR}
ENV CGO_CPPFLAGS="-I/usr/include"
ENV CGO_LDFLAGS="-L/usr/lib -lzmq -lpthread -lrt -lstdc++ -lm -lc -lgcc"
ENV CC="/usr/bin/arm-linux-gnueabihf-gcc"
ENV CFLAGS="-march=armv7-a -mfpu=neon"
ENV PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
ENV CGO_ENABLED=1
ENV GOOS=linux
ENV GOARCH=arm
ENV GOARM=7

VOLUME ${PROJECT_DIR}
ENTRYPOINT ["go", "install", "-v", "--ldflags", "-extldflags '-static'"] 