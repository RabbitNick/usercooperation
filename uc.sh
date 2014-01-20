#! /bin/sh

sudo ifconfig eth0 192.168.2.1 up
sudo ifconfig eth1 192.168.3.1 up 
sudo ifconfig eth3 192.168.4.1 up 
sudo ifconfig eth4 192.168.5.1 up 


sudo wondershaper eth0 800 800
sudo wondershaper eth1 800 800
sudo wondershaper eth3 800 800
sudo wondershaper eth4 800 800

#udo tc qdisc add dev eth4 root handle 1:0 tbf rate 800kbit buffer 1600 limit 3000
#sudo tc qdisc add dev eth4 parent 1:0 handle 10: netem delay 400ms loss 10%