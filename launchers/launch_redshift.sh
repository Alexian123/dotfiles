#! /bin/bash

killall -q redshift
killall -q redshift-gtk

while pgrep -u $UID -x redshift-gtk >/dev/null; do sleep 1; done

redshift-gtk

exit 0
