#!/bin/bash
# Reference: https://linoxide.com/linux-how-to/connect-wifi-terminal-ubuntu-16-04/

# Check the name of wifi device
sudo ip link show|grep wlan

# If wireless card name, from previous command, is wlan0, following command turns on the respective device
sudo ifconfig wlan0

# Once the card is on, we can connect to the wireless network using following command
#iwconfig wlan0 essid <name> key s:<password>
iwconfig wlan0 essid SERJIANS key s:R@kesh@123

# We can requiest ip manually using
dhclient wlan0

# Check IP and ping outside network
ip addr 
ping 8.8.8.8

