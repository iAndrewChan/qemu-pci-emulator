# QEMU PCI Emulator

## QEMU setup

* Install qemu build libraries `install-qemu-dependencies.sh`
* Download QEMU on github
* `mkdir build` in qemu directory
* run `qemu-build.sh build`

## Start up vm without disk

* `qemu-system-i386 -cdrom FILENAME.iso -m 512`

## Install OS onto disk

### Installation

* Download Linux OS distro image e.g Tiny core Linux iso
* Edit `start_vm.sh` to edit the `-cdrom FILENAME.iso` in the install conditional
* Run `start_vm install` - this will create a disk image and start up the vm ready installing the OS to the disk image

#### Inside the VM

__Note__: instructions are written for installing tiny core linux

* Install cfdisk using, the package manager, `tce-ab`
* Create a partition which can be found in [https://distro.ibiblio.org/tinycorelinux/install_manual.html](https://distro.ibiblio.org/tinycorelinux/install_manual.html) section 3.
* Download `tc-install.tcz` using `tce-ab`
* Run the `tc-install.sh`
* Poweroff the vm and run `start_vm` - this will run the vm without the cdrom

## Create disk image in qcow2 format

`qemu-img create -f qcow2 disk.qcow2 500M`

## Attaching a device on a vm

`-device DEVICENAME` added the parameter to the start up command, which is mentioned in the installation.

## edu device

refer to for a basic PCI device:

* qemu/hw/misc/edu.c
* qemu/docs/specs/edu.txt

`-device edu`

In the virtual machine we can see the edu device is "Unclassified device [00ff]: Device 1234:11e8 (rev 10)"
