#!/bin/bash
if [ -z $1 ]; then
    echo "Error: Please provide tracking number";
    exit 1;
fi;
if [ -z $2 ]; then
    UA="Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0";
else
    UA=$2;
fi;
echo "Using user agent: $UA";
sts=$(curl -A "$UA" "https://tools.usps.com/go/TrackConfirmAction?tRef=fullpage&tLabels=$1" | hxclean | hxselect -i -c ".thPanalAction span");
sts=${sts//"<strong>"/"________________________________________________\r\n"};
sts=${sts//"</strong>"/""};
sts=${sts//"&nbsp;"/" "};
notify-send "USPS package status" "$(echo -e $sts)" --icon=dialog-information;





