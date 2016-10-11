#!/bin/bash
#scp  -r solar@test01:/apkpath /Users/lemon/work/tmp
#filename=`ls -l | tail -n 1 | awk '{print $9}'`
#echo $filename
#mv $filename 
packagename=$1
device_num=`adb devices | grep "device"$ | wc -l`
for ((i=1;i<=$device_num;i++))
do
device_serialname=` adb devices | grep "device"$ | awk '{print $1}' | sed -n "${i}p"`

if [ $i != $device_num ]
then
	echo xxxx
	sh monkey.sh $device_serialname $packagename 24000  ./monkey_log.log_$device_serialname &
	echo $device_serialname"start------------------------------------>"

else
	echo $device_serialname"last------------------------------------>"
	sh monkey.sh $device_serialname $packagename 28000 ./monkey_log.log_$device_serialname
fi


#cp result/$device_serialname/*.html ./xmllog/


done