#! /bin/sh
#name = "test"

#FILE=$1
MODE=$1
#PREFIX=$2

FILE2="$2" 
FILE3="$3"
FILE4="$4"
FILE5="$5"

#cat testaa | socat - TCP:192.168.2.2:8000 &
#cat testac | socat - TCP:192.168.3.2:8002 &
#cat testab | socat - TCP:192.168.4.2:8000 &


if [ "$MODE"x = "T"x ]; then
	#statements
	echo "TCP Cooperation!"
	socat TCP:192.168.2.2:8000 ./FILE2 &
	sleep 1
	socat TCP:192.168.3.2:8002 ./FILE3 &
	sleep 1
	socat TCP:192.168.4.2:8000 ./FILE4 &
	sleep 1
	socat TCP:192.168.5.2:8000 ./FILE5 &
	sleep 1
fi

if [ "$MODE"x = "U"x ]; then
	#statements
	echo "UDP Cooperation!"
	socat UDP:192.168.2.2:8000 ./FILE2 &
	sleep 2
	socat UDP:192.168.3.2:8002 ./FILE3 &
	sleep 2
	socat UDP:192.168.4.2:8000 ./FILE4 &
	sleep 2
	socat UDP:192.168.4.2:8000 ./FILE5 &
	sleep 2
fi






echo $1
echo $?
wait




