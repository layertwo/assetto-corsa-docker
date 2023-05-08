FROM ubuntu:18.04
MAINTAINER Germán Robledo <germix@germix.net>

ENV DEBIAN_FRONTEND=noninteractive

ENV AC_FOLDER=assetto

ENV STEAM_USER=
ENV STEAM_PASSWORD=

ENV AC_SERVER_NAME=AC_Server
ENV AC_PASSWORD=
ENV AC_ADMIN_PASSWORD=mypassword
ENV AC_UDP_PORT=9600
ENV AC_TCP_PORT=9600
ENV AC_HTTP_PORT=8081
ENV AC_PLUGIN_ADDRESS_LOCAL_PORT=10001
ENV AC_PLUGIN_LOCAL_PORT=10002

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y libc6:i386 libgcc1:i386 libstdc++6:i386 libz1:i386 libssl-dev:i386 libssl-dev lib32gcc1 unzip ca-certificates && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN [ "/bin/bash", "-c", "mkdir -p /opt/{assetto,steamcmd}" ]

COPY files/steamcmd_linux.tar.gz /opt/steamcmd/steamcmd.tar.gz

ADD scripts/ /usr/local/bin

RUN unpack-all.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
