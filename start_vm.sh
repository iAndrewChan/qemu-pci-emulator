#!/bin/bash


if [[ $1 == "install" ]]; then
    qemu/build/x86_64-softmmu/qemu-system-x86_64 \
    -cdrom core.iso \
    -m 512 \
    -hda disk.qcow2 \
    -device e1000 \
    -device edu
    exit
fi

# Load OS onto RAM
qemu/build/x86_64-softmmu/qemu-system-x86_64 \
-m 512 \
-hda disk.qcow2 \
-device e1000 \
-device edu
