monitors=$(xrandr | grep -e "[ ]connected[ ]" | awk '{ print $1 }')

# echo brightness
xrandr --verbose | sed -n -e '/[ ]connected/,/Brightness/p' | sed -e '/\t/{H;$!d;};x;s/connected.*Brightness: //g'
# set brightness
#xrandr --output HDMI-A-0 --brightness 0.6

if [ $(echo $monitors | grep HDMI-A-0 | wc -l) == "1" ]
then
	echo "KBRW screen"
	/usr/bin/sh ~/.screenlayout/kbrw.screen.sh	
else
	echo "Normal"
	/usr/bin/sh ~/.screenlayout/kbrw.normal.sh	
fi


