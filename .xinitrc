#xrdb -load $HOME/.Xresources
setxkbmap -option terminate:ctrl_alt_bksp &

usermodmap=$HOME/.Xmodmap
userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

#sudo mount --bind $HOME $HOME/dev/git/dotfiles
#wicd-gtk &
#alsa-tray &

xscreensaver -no-splash &

#dropboxd &
xcompmgr -cF &

udiskie &

xsetroot -cursor_name left_ptr

eval $(cat ~/.fehbg)

DEFAULT_SESSION=i3

case $1 in
i3)
	exec ck-launch-session dbus-launch i3
	;;
ratpoison)
	exec ck-launch-session dbus-launch ratpoison
	;;
stumpwm)
	exec ck-launch-session dbus-launch stumpwm
	;;
musca)
	exec ck-launch-session dbus-launch musca
	;;
herbstluftwm)
	exec ck-launch-session dbus-launch herbstluftwm
	;;
awesome)
	exec ck-launch-session dbus-launch awesome
	;;
xmonad)
	trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 6 --transparent true --alpha 0 --tint 0x000000 --height 16 &  
	xmobar $HOME/.xmonad/.xmobarrc &
	exec ck-launch-session dbus-launch xmonad
	;;
*)
	exec $DEFAULT_SESSION
	;;
esac
