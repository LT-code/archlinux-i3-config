#!/bin/bash
# changeVolume

# Arbitrary but unique message tag
msgTag="brightness"

# Query amixer for the current volume and whether or not the speaker is muted
brightness=$(xbacklight | awk '{print int($1)}')

dunstify -a "changeBright" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag -h int:value:"$brightness" " Brightness: ${brightness}%"

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"

# refresh i3blocks
pkill -RTMIN+9 i3blocks
