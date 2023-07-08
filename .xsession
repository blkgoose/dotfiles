#!/bin/sh

# load screen configuration
autorandr -c

# background loading
nitrogen --set-zoom-fill /etc/wallpaper

# color scheme on-the-fly
wal --theme base16-gruvbox-medium

# init keyboard shortcuts
xbindkeys --poll-rc

# load Xresources
xrdb -merge ~/.Xresources

while true
do
    dwm 2> ~/.dwm.log
done
