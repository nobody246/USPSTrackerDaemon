#!/bin/bash
if [ -z $2 ]; then
    echo "USAGE: launch.sh (message interval in seconds) (postal tracking code)";
fi
zz=600;
if [ ! -z $1 ]; then
    zz=$1;
fi
nohup ./dmon.sh $zz $2 &> /dev/null &
