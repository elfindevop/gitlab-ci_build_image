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
        libcurl4-gnutls-dev \
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
        libmediainfo-dev \
        qtbase5-private-dev \
        libfontconfig1-dev \
        libglib2.0-dev \
        libfreetype6-dev \
        libxrender-dev \
        libudev-dev \
        libmtdev-dev \
        && apt-get clean;

RUN git clone https://github.com/google/googletest.git googletest \
        && cd googletest \
        && cmake -DBUILD_GMOCK=ON -DCMAKE_INSTALL_PREFIX=/usr/ ./CMakeLists.txt && make && make install \
        && cd -;

RUN mkdir -p /usr/lib/x86_64-linux-gnu \
        && ln -s libboost_thread.so /usr/lib/x86_64-linux-gnu/libboost_thread-mt.so;

RUN git clone https://github.com/elfin-sbreuers/mqtt_cpp.git \
        && mkdir mqtt_cpp/build \
        && cd mqtt_cpp/build \
        && cmake -DMQTT_NO_TLS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF .. \
        && make install

COPY files/bump_patch_version /usr/local/bin/bump_patch_version

RUN mkdir /workspace
RUN chmod 777 /workspace
WORKDIR /workspace
