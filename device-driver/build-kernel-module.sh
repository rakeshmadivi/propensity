#!/bin/bash
# DEVICE DRIVER DEVELOPMENT
# Two ways driver can be implemented
# One. Can be included and compiled with kernel
# Two. It can be compiled as modules and loaded at runtime.

# 1. Have a module source code being written in hand

# Building the module using Linux Kernel Build System.
# We need to hava Kernel Sources or atleast Kernel Headers being installed on the system
# To install the Headers execute the following commands

sudo apt-get update
sudo apt-get install linux-headers-$(uname -r)
