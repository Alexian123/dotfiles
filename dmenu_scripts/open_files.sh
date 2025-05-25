#! /bin/bash

# Simple dmenu script for opening files

DMENU_CMD="dmenu -p Open: -i -l 20"
EDIT_CMD="$TERMINAL -e $EDITOR"

CHOICE=$(/usr/bin/ls -a $HOME | $DMENU_CMD)
FULL_PATH="$HOME/$CHOICE"

while [[ "$CHOICE" != "." &&  -d "$FULL_PATH" ]]
do
    CHOICE=$(/usr/bin/ls -a $FULL_PATH | $DMENU_CMD)
    FULL_PATH="$FULL_PATH/$CHOICE"
done

if [[ "$CHOICE" == "." ]]; then
    exit 0
fi

if /usr/bin/file $(/usr/bin/readlink -f "$FULL_PATH") | grep -q text$; then
    $GEDITOR "$FULL_PATH"
else
    /usr/bin/xdg-open $FULL_PATH
fi

exit 0
