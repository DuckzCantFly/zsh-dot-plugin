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
		# Ibus
		export GTK_IM_MODULE=ibus
		export XMODIFIERS=@im=ibus
		export QT_IM_MODULE=ibus
		;;
	*)
esac
