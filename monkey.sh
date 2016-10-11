#!/bin/bash
deviceid=$1
packagename=$2
monkeytimes=$3
path=$4
adb -s $deviceid shell monkey -p $packagename  --monitor-native-crashes  --pct-touch 40 --pct-motion 30 --pct-trackball 0 --pct-nav 0 --pct-majornav 5 --pct-appswitch 20 --pct-anyevent 5 -v --throttle 300 $monkeytimes > $path