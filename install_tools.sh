#! /bin/sh

sudo apt-get install cmake g++ gcc && \

RUN apt-get update && apt-get install -y sudo vim curl pkg-config build-essential ninja-build automake autoconf libtool wget curl git gcc libssl-dev bc slib squashfs-tools  tree python3-dev python3-pip device-tree-compiler ssh cpio fakeroot libncurses5 libncurses5-dev genext2fs rsync unzip mtools tclsh ssh-client  && \
    apt-get install -y vim gcc g++ cmake libgsl-dev make git


    echo "installation Done!"

