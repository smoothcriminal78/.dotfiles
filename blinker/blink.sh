#!/bin/bash

LEDS=(num caps scroll)

#INITTTY=/dev/tty[1-6]
# for (( ; ; ))
# do
# 	for tty in $INITTTY; do
# 		for led in ${LEDS[@]}; do
# 			setleds -L +$led < $tty 
# 			sleep .5
# 			setleds -L -$led < $tty
# 		done
# 	done
# done

tty=/dev/tty0

for (( ; ; ))
do
	for led in ${LEDS[@]}; do
		setleds -L +$led < $tty 
		sleep .5
		setleds -L -$led < $tty
	done
done
