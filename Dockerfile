FROM ubuntu:trusty
MAINTAINER lewicki.pk@gmail.com

RUN apt-get update && apt-get install -y \
        automake \
        g++ \
        git \
        libboost-all-dev \
        libcgicc5-dev \
        libjsoncpp-dev \
        libssl-dev \
        libtool \
        make \
        openssl \
        pkg-config \
        && apt-get clean

#ENV CONTAINER_USERNAME='rapidflask'
#ENV CONTAINER_GROUPNAME='rapidflask'
#ENV HOMEDIR='/home/'$CONTAINER_USERNAME
#
## add non root user
#RUN  adduser --disabled-password --gecos '' $CONTAINER_USERNAME && \
#  adduser $CONTAINER_USERNAME sudo && \
#  chown -R $CONTAINER_USERNAME:$CONTAINER_GROUPNAME $HOMEDIR
#
## dirs and permissions
#RUN mkdir -p /usr/src/$CONTAINER_USERNAME &&\
#  mkdir -p /srv/$CONTAINER_USERNAME &&\
#  chown $CONTAINER_USERNAME /usr/src/$CONTAINER_USERNAME -R && \
#  chown $CONTAINER_USERNAME $HOMEDIR && \
#  chown $CONTAINER_USERNAME /srv/$CONTAINER_USERNAME && \
#  /usr/bin/pip3 install virtualenv
#
##change user
#USER rapidflask
#WORKDIR /usr/src/rapidflask
#ENV LANG c.utf8
#ENV LC_ALL c.utf8
#ENV LANGUAGE en_US.utf8
#RUN virtualenv -p python3 rAPPenv --no-site-packages
#ENV VIRTUAL_ENV /usr/src/rapidflask/rAPPenv
#ENV  PATH "$VIRTUAL_ENV/bin:$PATH"
#RUN pip install bpython --upgrade
#WORKDIR /srv/rapidflask
#
#CMD ["bpython"]
