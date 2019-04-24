#!/bin/bash

launch()
{
    udid=$(simctl list | grep -m 1 " iPhone $1" | awk '{print $3}' | tr -d "()")
    echo "iPhone $1 : $udid"
    simctl boot $udid
    echo $2
    simctl install booted $2
    open -a Simulator --args -CurrentDeviceUDID $udid
}

if [ $# != 2 ] ; then
    echo "usage: run.sh iPhone_model App.app"
    exit 1
fi

launch $1 $2

