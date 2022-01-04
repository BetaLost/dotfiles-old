#!/bin/bash

while :; do
	CUR_VOL=$(pulsemixer --get-volume | awk '{print $1}')
	MUTE_STAT=$(pulsemixer --get-mute)
	
	if [[ $MUTE_STAT == "0" ]]; then
		VOL_ICON="墳"
		echo "%{+u}%{u#f50a4d}%{F#666}$VOL_ICON %{F-}  ${CUR_VOL%.*}%"
	elif [[ $MUTE_STAT == "1" ]]; then
		VOL_ICON="婢"
		echo "%{F#666}$VOL_ICON  ${CUR_VOL%.*}%%{F-} "
	fi

done
