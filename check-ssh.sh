#!/bin/bash

FILES=$HOME/.ssh/*
for f in $FILES
do
    filetype=$(file $f | cut -f2 -d' ')
    if [ $filetype == "PEM" ]
    then
	if [ -z $(grep -L ENCRYPTED $f) ]
	then
	    echo "$f is secured with a passphrase"
	else
	    echo "Alert, Alert! $f is not encrypted"
	fi
    fi
done
