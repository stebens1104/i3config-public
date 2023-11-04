#! /bin/sh

chosen=$(printf "⏻ Power Off\n Restart\n󰍃 LogOut\n Lock" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"⏻ Power Off") /usr/sbin/poweroff ;;
	" Restart") /usr/sbin/reboot ;;
	"󰍃 LogOut") i3-msg exit ;;
	" Lock") i3lock-fancy ;;
        *) exit 1 ;;
esac	

