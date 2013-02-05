#xrdb -load $HOME/.Xresources
setxkbmap -option terminate:ctrl_alt_bksp &
xsetroot -cursor_name left_ptr &

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

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

eval $($HOME/.fehbg)

DEFAULT_SESSION=dswm

case $1 in
enlightenment)
	exec ck-launch-session  dbus-launch --sh-syntax --exit-with-session enlightenment_start
	;;
kde)
	exec ck-launch-session  dbus-launch --sh-syntax --exit-with-session startkde
	;;
gnome)
	exec ck-launch-session  dbus-launch --sh-syntax --exit-with-session gnome-session
	;;
cinnamon)
	exec ck-launch-session  dbus-launch --sh-syntax --exit-with-session gnome-session-cinnamon
	;;
DSWM)
	exec ck-launch-session  dbus-launch --sh-syntax --exit-with-session dswm --userinit $HOME/.dswm.d/init.lisp
	;;
compiz)
	exec ck-launch-session  dbus-launch --sh-syntax --exit-with-session /home/ubermenschjo/bin/start-compiz.sh 
	;;
xmonad)
	PATH=$PATH:~/.cabal/bin:~/.xmonad/bin
	tray &
	$HOME/.cabal/bin/xmobar $HOME/.xmonad/xmobar-bottom.hs &
	exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad
	;;
*)
	exec ck-launch-session dbus-launch --sh-syntax --exit-with-session $1
	;;
esac



