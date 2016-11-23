#!/bin/bash

# This script resets the computer name, based upon the name of
# the user and the system model

CURRENT_NAME=$HOSTNAME
# collect system architecture
ARCHITECTURE=`system_profiler |grep 'Model Identifier:' | awk -F'[:,]' {'gsub(/ /, "", $2); print $2'}`

# identify the new name
NEW_NAME="$USER-$ARCHITECTURE"

# set the new name  (needs to be run as root)
# log results
if scutil –-set HostName $NEW_NAME ; then
	echo "$CURRENT_NAME was successfully changed to $NEW_NAME"
else
	echo "something went horribly wrong"
fi
