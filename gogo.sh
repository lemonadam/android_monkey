#!/bin/bash
packagename=$1
sh go.sh $packagename
sleep 1800
sh kill.sh
sleep 10
sh go.sh $packagename