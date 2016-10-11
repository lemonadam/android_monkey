#!/bin/bash
#scp  -r solar@test01:/var/www/apps/android/100/alpha/solar-2.3.0-fenbi-test-2015*  /Users/lemon/work/tmp
#filename=`ls -l | tail -n 1 | awk '{print $9}'`
#echo $filename
#mv $filename solar.apk

device_num=`adb devices | grep "device"$ | wc -l`
for ((i=1;i<=$device_num;i++))
do
device_serialname=` adb devices | grep "device"$ | awk '{print $1}' | sed -n "${i}p"`

#if [ "$device_serialname" = "4df72a1f1bbc31db" ]
#then
#echo "doest not reboot device $device_serialname"
#else
#echo "reboot device $device_serialname"
echo $device_serialname
adb -s $device_serialname uninstall com.ss.android.essay.joke
adb -s $device_serialname install joke.apk
echo $device_serialname"安装成功"
mkdir -p result/$device_serialname
done
