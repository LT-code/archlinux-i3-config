#!/bin/bash

# Change the volume using alsa(might differ if you use pulseaudio)
amixer sset Master 4%-

sh ~/.config/i3/scripts/volume/show-status.sh
