[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xset r rate 200 30

exec i3
