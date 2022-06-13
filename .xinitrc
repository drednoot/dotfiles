# mouse sensitivity
xinput --set-prop "pointer:COMPANY  USB Device " "libinput Accel Speed" "-1.0"
xinput --set-prop "pointer:COMPANY  USB Device" "libinput Accel Profile Enabled" 0 1
# russian layout on alt+shift toggle
setxkbmap -layout us,ru -option grp:alt_shift_toggle
# background using feh
~/.fehbg
# opacity (didn't seem to be used anywhere else other than the terminal)
xcompmgr -c &
# dwm status bar
slstatus &
# color scheme and stuff
xrdb ~/.Xresources
# xbindkeys
xbindkeys 

# remove tearing
xrandr --output HDMI-A-0 --set TearFree off


# screensaver set to half an hour
xset s 1800 1800

exec dwm
# exec awesome

