# QEMU PCI Emulator

## img to qcow2

* Downlaod the mini.iso Ubuntu

## QEMU setup

* Install qemu build libraries `install-qemu-dependencies.sh`
* Download QEMU on github
* `mkdir build` in qemu directory
* run `qemu-build.sh`

## Start up vm without disk

* ` qemu-system-i386 -cdrom os.iso -m 512`

## Install OS onto disk

### Create disk image in qcow2 format

`qemu-img create -f qcow2 disk.qcow2 500M`

### Installation

* Download Linux OS distro image e.g Tiny core linux iso
* Attach image to cdrom and start the vm with a hard drive attached
* `qemu-system-i386 -boot d -cdrom os.iso -m 512 -hda disk.img`

## Attaching an existing device on Vm

`-device DEVICENAME` added the parameter to the start up command, which is mentioned in the installation.

## edu device

refer to for a basic PCI device:

* qemu/hw/misc/edu.c
* qemu/docs/specs/edu.txt

`-device edu`

In the virtual machine we can see the edu device is "Unclassified device [00ff]: Device 1234:11e8 (rev 10)"
