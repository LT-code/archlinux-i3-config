#!/bin/bash

# Change the volume using alsa(might differ if you use pulseaudio)
pactl set-sink-mute 0 toggle

sh ~/.config/i3/scripts/volume/show-status.sh
