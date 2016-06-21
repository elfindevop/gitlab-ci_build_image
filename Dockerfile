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
        mkdir -p /lib/modules/3.19.0-59-generic/ \
        mkdir -p /usr/src/ \
        cd /lib/modules/3.19.0-59-generic/ \
        ln -s /usr/src/linux-headers-3.19.0-59-generic build \
        cd - \
        git clone https://github.com/lewicki-pk/linux-headers-3.19.0-59.git /usr/src/linux-headers-3.19.0-59 \
        git clone https://github.com/lewicki-pk/linux-headers-3.19.0-59-generic.git /usr/src/linux-headers-3.19.0-59-generic

# libtool-bin was created/splitted in 16.04
#        libtool-bin
