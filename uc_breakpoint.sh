
#! /bin/sh

FILENAME=$1
NUM=$2
LOSSNUM=$3




SIZE=$(stat -c '%s' $FILENAME)
echo $SIZE
echo $NUM

each_size=$(($RANDOM*$SIZE)/(32768*$NUM)))

echo $each_size


dd if=$FILENAME bs=1 count=$(($SIZE - $each_size))
#each_size=$(($SIZE/$NUM))
#echo $each_size
#split -C $each_size $FILENAME suc_

