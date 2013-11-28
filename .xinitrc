#xrdb -load $HOME/.Xresources

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
stumpwm)
	exec stumpwm
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
