#!/bin/bash

# References: 
# 1. https://wiki.debian.org/KVM
# 2. https://linuxconfig.org/how-to-create-and-manage-kvm-virtual-machines-from-cli
# 3. https://www.cyberciti.biz/faq/install-kvm-server-debian-linux-9-headless-server/

# Requirements:
: '
	Root access
	Packages:
		qemu-kvm - The main package
		libvirt - Includes the libvirtd server exporting the virtualization support
		libvirt-client - This package contains virsh and other client-side utilities
		virt-install - Utility to install virtual machines
		virt-viewer - Utility to display graphical console for a virtual machine
'

method1()
{
	# Install required packages
	sudo apt install qemu-kvm libvirt-clients qemu-utils libvirt-daemon-system
	sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin

	# To perform VM creation as normal user, add the user to libvirt and libvirt-qemu groups
	sudo $USER libvirt
	sudo $USER libvirt-qemu

	# Check for Virtualization Support by CPU
	grep "svm|vmx" /proc/cpuinfo

	# Check if KVM Modules are loaded
	sudo lsmod | grep kvm

	# By default kvm_intel is not loaded, to load the module run following command
	sudo modprobe kvm_intel		# Module for AMD processor is 'kvm_amd'

	# Now start the libvirtd daemon to export the Virtualization Support
	systemctl enable --now libvirtd		# Enable the daemon to start at boot time

	# Now enabled libvirtd, we can create virtual machine with following command
	# NOTE: --name is mandatory opion to name VM; Memory in MiB; disk size in GBs;  
	virt-install --name=linuxconfig-vm \
		--vcpus=1 \
		--memory=1024 \
		--cdrom=/tmp/debian-9.0.0-amd64-netinst.iso \
		--disk size=5 \
		--os-variant=debian8
}

method2()
{
	# References:
	# 1. https://linuxwebdevelopment.com/run-debian-qemu-kvm-virtual-machine-using-ubuntu-debian/

	# Install QEMU and KVM
	sudo apt-get install qemu qemu-kvm

	# Get any debian ISO image
	# Create a directory to hold the ISO files and 

	# Create a qemu image with 5G harddrive space
	qemu-img create -f qcow2 virtualdebian.img 5G

	# Emulate Opening The Debian ISO File As a CD-ROM/DVD Drive And Install Debian In The Virtual Machine
	kvm -hda virtualdebian.img -cdrom debian-9.6.0-amd64-xfce-CD-1.iso -m 2048 -net nic -net user -soundhw all

	# Run the debian as you want
	kvm -soundhw all -m 2048 -hda ~/debian/virtualdebian.img
}
