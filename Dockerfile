FROM ubuntu:trusty
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
        make \
        openssl \
        pkg-config \
        wget \
        && apt-get clean \
        \
        && git clone https://github.com/google/googletest.git \
        && cd googletest \
        && cmake -DCMAKE_INSTALL_PREFIX=/usr/ ./CMakeLists.txt && make && make install \
        \
        && git clone https://github.com/lewicki-pk/rpi-sysroot.git /rpi-sysroot/ \
        \
        && wget https://releases.linaro.org/components/toolchain/binaries/4.9-2016.02/arm-linux-gnueabihf/gcc-linaro-4.9-2016.02-i686-mingw32_arm-linux-gnueabihf.tar.xz \
        && mkdir /tools && tar xf gcc-linaro-4.9-2016.02-i686-mingw32_arm-linux-gnueabihf.tar.xz -C /tools/
