#! /bin/bash

killall -q wicd-client

while pgrep -u $UID -x wicd-client >/dev/null; do sleep 1; done 

wicd-client --tray

exit 0
