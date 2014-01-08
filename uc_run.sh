#! /bin/sh
#name = "test"

FILE=$1



#cat testaa | socat - TCP:192.168.2.2:8000 &
#cat testac | socat - TCP:192.168.3.2:8002 &
#cat testab | socat - TCP:192.168.4.2:8000 &


# socat TCP:192.168.2.2:8000 ./testaa &
# sleep 1
# socat TCP:192.168.3.2:8002 ./testac &
# sleep 1
# socat TCP:192.168.4.2:8000 ./testab &
# sleep 1


# socat UDP:192.168.2.2:8000 ./codeaa &
# sleep 2
# socat UDP:192.168.3.2:8002 ./codeac &
# sleep 2
# socat UDP:192.168.4.2:8000 ./codeab &
# sleep 2



echo $?
wait




