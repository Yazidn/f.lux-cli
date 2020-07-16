#!/bin/bash

current_time=$(date +%H)
color_temperature=$1

enable(){
	# You real location coordinates.

	# Algeria
	xflux -l -0.518490 -g 35.631150 -k $color_temperature
}

force_enable(){
	# Somewhere where it's night time
	# 14 hours of difference worked best.

	#Kiritimati
	xflux -l 1.872000 -g -157.384216 -k $color_temperature
}

start(){
	if [[ "$current_time" -ge "17" ]] || [[ "$current_time" -le "04" ]]; then
		enable
		echo "Enabled."
	else
		force_enable
		echo "Enabled. Forced."
	fi
}

if [[ $(pidof flux) ]]; then
	kill $(pidof flux)
	echo "Stopped."
else
	start
fi
