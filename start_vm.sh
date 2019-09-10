#!/bin/bash

qemu/build/x86_64-softmmu/qemu-system-x86_64 \
-cdrom core.iso \
-m 512 \
-device e1000 \
-device edu
