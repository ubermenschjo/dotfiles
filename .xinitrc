#xrdb -load $HOME/.Xresources
setxkbmap -option terminate:ctrl_alt_bksp &
xsetroot -cursor_name left_ptr &

usermodmap=$HOME/.Xmodmap
userresources=$HOME/.Xresources.zenburn

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

/usr/lib/systemd/systemd --user &

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f $HOME/.xprofile ] && . $HOME/.xprofile
[ -f $HOME/.xrandrrc ] && . $HOME/.xrandrrc

eval $($HOME/.fehbg)

DEFAULT_SESSION=dswm

case $1 in
enlightenment)
	exec enlightenment_start
	;;
kde)
	exec startkde
	;;
i3)
	exec i3
	;;
fvwm)
	exec fvwm
	;;
fluxbox)
	exec fluxbox
	;;
openbox)
	exec openbox-session
	;;
gnome)
	exec gnome-session
	;;
cinnamon)
	exec gnome-session-cinnamon
	;;
awesome)
	exec awesome
	;;
awesome-powerarrow)
	exec awesome --config $HOME/.config/awesome/rc.lua.powerarrow-darker
	;;
awesome-blackburn)
	exec awesome --config $HOME/.config/awesome/rc.lua.blackburn
	;;
awesome-multicolor)
	exec awesome --config $HOME/.config/awesome/rc.lua.multicolor
	;;
DSWM)
	exec dswm --userinit $HOME/.dswm.d/init.lisp
	;;
compiz)
	exec compiz ccp 
	#exec $HOME/bin/start-compiz.sh
	;;
xmonad)
	PATH=$PATH:$HOME/.cabal/bin:$HOME/.xmonad/bin
	tray &
	$HOME/.cabal/bin/xmobar $HOME/.xmonad/xmobar-bottom.hs &
	exec xmonad
	;;
*)
	#exec $1
	exec awesome
	;;
esac



