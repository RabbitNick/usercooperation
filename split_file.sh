#! /bin/sh

FILENAME=$1
NUM = $2



echo "The file name : $FILENAME"
echo "split NUM : $NUM"


if [ -z "$FILENAME" ];
then
  echo "Please enter file name!"
  return 1
  exit -1
fi

SIZE = du -sh $FILENAME | awk '{print $1}'
EACH_SIZE = SIZE/NUM

split -C EACH_SIZE $FILENAME