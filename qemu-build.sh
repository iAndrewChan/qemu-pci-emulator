#!/bin/bash

HOME="/home/andrew/fileshare"

function build_qemu {
    cd $HOME/qemu-pci-emulator/qemu/build
    ../configure --target-list=x86_64-softmmu
    make -j
}

if [[ $1 == "build" ]]; then
    cp qemu_devices/edu.c qemu/hw/misc/
    build_qemu
fi

if [[ $1 == "reset" ]]; then
    cp qemu_devices/edu_original.c qemu/hw/misc/edu.c
    build_qemu
fi
