FROM ubuntu:trusty
MAINTAINER lewicki.pk@gmail.com

RUN apt-get update && apt-get install -y \
        automake \
        cmake \
        g++ \
        git \
        libboost-all-dev \
        libcgicc5-dev \
        libgtest-dev \
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
        && cd /usr/src/gtest/ && cmake CMakeLists.txt && make && cp *.a /usr/lib
