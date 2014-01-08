#! /bin/sh

FILENAME=$1
NUM=$2




if [ -z "$FILENAME" ];
then
  echo "Please enter file name!"
  return 1
  exit -1
fi

if [ -z "$NUM" ];
then
  echo "Please enter NUM!"
  return 2
  exit -1
fi


echo "The file name : $FILENAME"
echo "split NUM : $NUM"


SIZE=$(stat -c '%s' $FILENAME)
echo $SIZE
echo $NUM
each_size=$(($SIZE/$NUM))
echo $each_size
split -C $each_size $FILENAME suc_
