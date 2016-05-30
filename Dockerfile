FROM ubuntu:16.04
MAINTAINER lewicki.pk@gmail.com

RUN apt-get update && apt-get install -y \
        automake \
        cmake \
        g++ \
        git \
        libboost-all-dev \
        libcgicc5-dev \
        libi2c-dev \
        libjsoncpp-dev \
        libpcre3-dev \
        libssl-dev \
        libtool \
        libtool-bin \
        make \
        openssl \
        pkg-config \
        tar \
        unzip \
        wget \
        && apt-get clean \
        \
        && git clone https://github.com/google/googletest.git \
        && cd googletest \
        && cmake -DCMAKE_INSTALL_PREFIX=/usr/ ./CMakeLists.txt && make && make install \
        \
        && wget https://github.com/lewicki-pk/rpi-sysroot/archive/master.zip \
        && unzip master.zip -d / \
        && mv /rpi-sysroot-master /rpi-sysroot \
        && rm master.zip \
        \
        && mkdir /tools \
        && wget http://releases.linaro.org/components/toolchain/binaries/4.9-2016.02/arm-linux-gnueabihf/gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz \
        && tar -xf gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz -C /tools/ \
        && rm gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz
