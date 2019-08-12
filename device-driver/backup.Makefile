# Makefile : makefile of our first driver
# # if KERNELRELEASE is defined , we ’ ve been invoked from the
# # kernel build system and can use its language .
ifneq ( ${ KERNELRELEASE } ,)
	obj-m := mymodule1.o
	# # Otherwise we were called directly from the command line .
	# # Invoke the kernel build system .
else
	KERNEL_SOURCE := /usr/src/linux-headers-4.9.0-8-amd64 #/ usr / src / linux - headers -3.16.0 -4 - amd64
	PWD := $(shell pwd)
	default :
		${MAKE} -C ${KERNEL_SOURCE} SUBDIRS=${PWD} modules
	clean :
		${MAKE} -C ${KERNEL_SOURCE} SUBDIRS=${PWD} clean
endif
#
