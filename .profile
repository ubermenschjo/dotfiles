export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export OOO_FORCE_DESKTOP="gnome"

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Enable UTF-8
export LANG="ko_KR.UTF-8"

# Keep the default sort order (e.g. files starting with a '.'
# should appear at the start of a directory listing.)
export LC_COLLATE="C"

# Set the short date to YYYY-MM-DD (test with "date +%c")
export LC_TIME="ko_KR.UTF-8"
