#!/bin/bash
killFile=/tmp/.killPOTrackerBot01234567;
rm $killFile;
while true
do
    if [ -f $killFile ]; then
	echo "Stop signal encountered. Exiting..";
	rm $killFile;
	exit 0;
    fi;
    ./track.sh $2;
    sleep $1;
done
