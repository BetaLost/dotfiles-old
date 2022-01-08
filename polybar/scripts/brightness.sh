#!/bin/bash

while :; do
	CUR_BRIGHT=$(light -G)
	echo "%{F#666}%{F-}  ${CUR_BRIGHT%.*}%"
	sleep 1
done
