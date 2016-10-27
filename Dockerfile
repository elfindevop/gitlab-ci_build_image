FROM ubuntu:16.04
MAINTAINER lewicki.pk@gmail.com

RUN apt-get update && apt-get install -y \
        automake \
        cmake \
        g++ \
        git \
        libboost-all-dev \
        libcgicc5-dev \
        libcurl4-openssl-dev \
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
        qt5-default \
        && apt-get clean \
        \
        && git clone https://github.com/google/googletest.git \
        && cd googletest \
        && cmake -DCMAKE_INSTALL_PREFIX=/usr/ ./CMakeLists.txt && make && make install \
        \
        && mkdir -p /usr/lib/x86_64-linux-gnu \
        && ln -s libboost_thread.so /usr/lib/x86_64-linux-gnu/libboost_thread-mt.so

# boost libraries with "-mt" suffix does not exist anymore. This should be fixed elsewhere but for convinience I'm adding this here.
