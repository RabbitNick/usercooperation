#! /bin/sh
FILENAME=$1
SIZE=$2


echo "The file name : $FILENAME"
echo "Size of the file : $SIZE"





if [ -z "$FILENAME" ];
then
  echo "Please enter file name!"
  return 1
  exit -1
fi


if [ -n "$SIZE" ];
then
	dd if=/dev/urandom of=$FILENAME bs=$SIZE count=1
else
	echo "default size of file = 10M"
	dd if=/dev/urandom of=$FILENAME  bs=10M count=1
fi

