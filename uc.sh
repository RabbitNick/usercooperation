#! /bin/sh

sudo ifconfig eth0 192.168.2.1 up
sudo ifconfig eth1 192.168.3.1 up 
sudo ifconfig eth3 192.168.4.1 up 

sudo wondershaper eth0 128 128
sudo wondershaper eth1 128 128
sudo wondershaper eth3 128 128


