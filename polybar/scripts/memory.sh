#!/bin/bash
while :; do
	free -m | awk 'FNR==2 {print $3}'
	sleep 5
done
