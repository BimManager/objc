#!/bin/bash

launch()
{
    path=/Users/kkozlov/Downloads/Xcode.app//Contents/Developer/usr/bin
    udid=$($path/simctl list | grep -m 1 " iPhone $1" | awk '{print $3}' | tr -d "()")
    echo "iPhone $1 : $udid"
    $path/simctl boot $udid
    echo $2
    $path/simctl install booted $2
    open -a Simulator --args -CurrentDeviceUDID $udid
    tail -f ~/Library/Logs/CoreSimulator/*/system.log
}

if [ $# != 2 ] ; then
    echo "usage: run.sh iPhone_model App.app"
    exit 1
fi

launch $1 $2


