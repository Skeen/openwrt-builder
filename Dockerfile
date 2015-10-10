FROM debian:jessie
MAINTAINER Emil Madsen <sovende@gmail.com>
LABEL Description="Building environment for openwrt images" Vendor="OpenWrt" Version="1.0"

RUN apt-get update
RUN apt-get install -y git-core build-essential libssl-dev libncurses5-dev unzip
RUN apt-get install -y gawk wget python2.7 subversion file

WORKDIR /home/
#RUN git clone git://git.openwrt.org/openwrt.git
RUN git clone git://git.openwrt.org/15.05/openwrt.git

WORKDIR /home/openwrt
RUN ./scripts/feeds update -a
RUN ./scripts/feeds install -a

RUN make defconfig
RUN make prereq

COPY build.sh /home/openwrt/build.sh
RUN chmod +x build.sh

ENTRYPOINT ["./build.sh"]
