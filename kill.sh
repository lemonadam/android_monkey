#!/bin/bash
#scp  -r solar@test01:/var/www/apps/android/100/alpha/solar-2.3.0-fenbi-test-2015*  /Users/lemon/work/tmp
#filename=`ls -l | tail -n 1 | awk '{print $9}'`
#echo $filename
#mv $filename solar.apk

device_num=`adb devices | grep "device"$ | wc -l`
for ((i=1;i<=$device_num;i++))
do
device_serialname=` adb devices | grep "device"$ | awk '{print $1}' | sed -n "${i}p"`

pid=`adb -s $device_serialname shell ps | grep 'com.android.commands.monkey' | awk '{print $2}'`
echo $pid
adb -s $device_serialname shell kill -9 $pid
echo $device_serialname"----kill成功"

done
