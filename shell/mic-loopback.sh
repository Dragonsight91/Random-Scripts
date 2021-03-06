#!/bin/bash

# this script was mainly made because discord doesn't support desktop audio with screen sharing and it annoyed me...
# this is a script that takes audio from a program and mixes it into the microphone audio
# the routing looks like this:
#
# Program -> vsink_in -> spk
#               |
#               V
#   mic  -> vsink_mic -> Discord

mic=$(pactl list sources | grep -A1 RUNNING | tail -n 1 | awk -F ":" '{print $2}' | xargs)
spk=$(pactl list sinks | grep -A1 RUNNING | tail -n 1 | awk -F ":" '{print $2}' | xargs)

echo "Creating virtual output devices"
pactl load-module module-null-sink sink_name=vsink_in sink_properties=device.description=vsink_in
pactl load-module module-null-sink sink_name=vsink_mic sink_properties=device.description=vsink_mic

echo "Creating loopbacks"
pactl load-module module-loopback latency_msec=30 adjust_time=3 source=$mic             sink=vsink_mic
pactl load-module module-loopback latency_msec=30 adjust_time=3 source=vsink_in.monitor sink=vsink_mic
pactl load-module module-loopback latency_msec=30 adjust_time=3 source=vsink_in.monitor sink=$spk

echo "Setting default devices"
pactl set-default-source vsink_mic.monitor
pactl set-default-sink $spk
