#!/usr/bin/env python

from RPi.GPIO import GPIO

pin_to_check = 11

# the pin numbers refer to the board connector not the chip
GPIO.setmode(GPIO.BOARD)  

# set up pin  (one of the above listed pins) as an input with a pull-up resistor
GPIO.setup(pin_to_check, GPIO.INPUT, GPIO.PUD_UP) 

if GPIO.input(pin_to_check):
    print "switch is open"
else:
    print "switch is closed"

