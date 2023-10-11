### Cusotme User Settings ###

case "${USERNAME}" in
	"gnome")
		(cat "${XDG_CONFIG_HOME:-$HOME/.config}/wpg/sequences" &)
		autotmux
		# Ibus
		export GTK_IM_MODULE=ibus
		export XMODIFIERS=@im=ibus
		export QT_IM_MODULE=ibus
		;;
	"dwm")
		# ibus
		export gtk_im_module=ibus
		export xmodifiers=@im=ibus
		export qt_im_module=ibus
		;;
	"chandler")
		autotmux
		# ibus
		export gtk_im_module=ibus
		export xmodifiers=@im=ibus
		export qt_im_module=ibus
		;;
	*)
esac
