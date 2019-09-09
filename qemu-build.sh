#!/bin/bash

HOME="/home/andrew/fileshare"

if [[ $1 == "build" ]]; then

    cd $HOME/qemu-pci-emulator/qemu/build
    ../configure --target-list=x86_64-softmmu
    make -j5
fi
