
#! /bin/sh

FILENAME=$1
NUM=$2
LOSSNUM=$3




SIZE=$(stat -c '%s' $FILENAME)
echo $SIZE
echo $NUM

echo $(($SIZE/$NUM))

each_size=$((($RANDOM*$SIZE)/(32768*$NUM)))

echo $each_size


# the download user and default are setting to send.
for((i=0; i < $NUM; i++));do
	who_break[i]=1
done





break_num=0
count=0
break_flag=0
while [[ $break_num -lt $LOSSNUM  ]]; do
	break_flag=$(($RANDOM*10/32768))
	echo "break_flag: "$RANDOM
	break_flag=$(($RANDOM % $NUM))
	echo "break point: "$break_flag
	if [[ ${who_break[break_flag]} -ne 0 ]]; then
		who_break[break_flag]=0
		break_num=$((break_num+1))
		echo "break_num : "$break_num
	fi
done

front_size=0

for((i=0; i < $NUM; i++));do
	echo $i ${who_break[$i]}
	if [[ ${who_break[$i]} -eq 0 ]]; then
		each_size=$((($RANDOM*$SIZE)/(32768*$NUM)))
		dd if=$FILENAME bs=1 count=$each_size skip=$front_size of=buc"$count""_""$i"
		front_size=$((each_size+front_size))
		count=$((count+1))
	fi
done

# dd if=$FILENAME bs=1 count=$each_size skip=$front_size of=buc

each_size=$(((SIZE-front_size)/(NUM-LOSSNUM)))
surplus=$(((SIZE-front_size)%(NUM-LOSSNUM)))

echo "each_size: "$each_size
echo "surplus: "$surplus
each_size=$((surplus+each_size))
#split -C $each_size $FILENAME suc
for((i=0; i < $NUM; i++));do
	if [[ ${who_break[$i]} -eq 1 ]]; then
		dd if=$FILENAME bs=1 count=$each_size skip=$front_size of=buc"$count""_""$i"
		front_size=$((each_size+front_size))
		count=$((count+1))
	fi
done



#dd if=$FILENAME bs=1 count=$each_size skip=0 of=buc1
#dd if=$FILENAME bs=1 count=$(($SIZE - $each_size)) skip=$each_size of=buc2


#each_size=$(($SIZE/$NUM))
#echo $each_size
#split -C $each_size $FILENAME suc_

