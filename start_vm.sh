#!/bin/bash


if [[ $1 == "install" ]]; then
    
    # Create disk image
    qemu/build/qemu-img create -f qcow2 disk.qcow2 500M

    qemu/build/x86_64-softmmu/qemu-system-x86_64 \
    -cdrom core.iso \
    -m 512 \
    -hda disk.qcow2 \
    -device e1000 \
    -device edu
    exit
fi

# Start up vm
qemu/build/x86_64-softmmu/qemu-system-x86_64 \
-m 512 \
-hda disk.qcow2 \
-device e1000 \
-device edu
