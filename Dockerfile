FROM ubuntu:18.04
MAINTAINER sebastian.breuers@elfin.de

RUN apt-get update && apt-get install -y \
        automake \
        busybox \
        cmake \
        curl \
        g++ \
        git \
        jq \
        lcov \
        libblkid-dev \
        libboost-all-dev \
        libcgicc-dev \
        libcurl4-openssl-dev \
        libdbus-1-dev\
        libgpgme11-dev \
        libi2c-dev \
        libjsoncpp-dev \
        libpcre3-dev \
        libqt5svg5-dev \
        libssl-dev \
        libsystemd-dev \
        libtar-dev \
        libtool \
        libtool-bin \
        make \
        openssl \
        pkg-config \
        tar \
        unzip \
        wget \
        autorevision \
        qt5-default \
        qtdeclarative5-dev \
        && apt-get clean \
        \
        && git clone https://github.com/google/googletest.git googletest \
        && cd googletest \
        && cmake -DBUILD_GMOCK=ON -DCMAKE_INSTALL_PREFIX=/usr/ ./CMakeLists.txt && make && make install \
        \
        && mkdir -p /usr/lib/x86_64-linux-gnu \
        && ln -s libboost_thread.so /usr/lib/x86_64-linux-gnu/libboost_thread-mt.so

# boost libraries with "-mt" suffix does not exist anymore. This should be fixed elsewhere but for convinience I'm adding this here.
