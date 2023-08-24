### Optional Program Alias RC ###

# Use $XINITRC variable if file exists.
if [ -f "$XINITRC" ] ; then
	alias startx="startx $XINITRC"
fi

# LF
if [ -x "$(command -v lf)" ] ; then
	# Change lf to lf uberzug
	if [ -x "$(command -v lfub)" ] ; then
		alias lf="lfub"
	fi
	cf(){
		local temp dir
		tmp="$(mktemp -uq)"
		trap 'rm -f $tmp >/dev/null 2>&1' HUP INT QUIT TERM PWR EXIT
		lf -last-dir-path="$tmp" "$@"
		if [ -f "$tmp" ]; then
				dir="$(cat "$tmp")"
				[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
		fi
	}
else
	cf(){ cd $@ && ls }
fi

# fch
if [ -n "$(command -v fch)" ] ; then
	alias neo="clear && fch"
fi

# Fastfetch
if [ -x "$(command -v fastfetch)" ] ; then
	alias neofetch="clear && fastfetch"
fi

# Zathura
if [ -x "$(command -v zathura)" ] ; then
	alias z="zathura"
	alias -s pdf="zathura"
fi

# FFMPEG
if [ -x "$(command -v ffmpeg)" ] ; then
	alias ffmpeg="ffmpeg -hide_banner"
fi

# Linkhandler
if [ -x "$(command -v linkhandler)" ] ; then
	alias l="linkhandler"
	alias -s {mkv,mp4,wedm,avi,mov}=linkhandler
fi

# Youtube-DL
if [ -x "$(command -v youtube-dl)" ] ; then
	alias \
		yt="youtube-dl --add-metadata -i" \
		yta="yt -x -f bestaudio/best"
fi

# XClip
if [ -x "$(command -v xclip)" ] ; then
	alias \
		qclp="tr -d '\n' | xclip -selection clipboard" \
		oclp="xclip -selection clipboard -o" \
		cpwd="pwd | qclp "
fi

# Nvim
if [ -x "$(command -v nvim)" ] ; then
	alias vim="nvim" vi="nvim" vimdiff="nvim -d" magit="nvim -c MagitOnly"
fi

# MPC
if [ -x "$(command -v mpc)" ] ; then
	alias \
		mp="mpc clear \
			&& mpc load default \
			&& mpc shuffle \
			&& mpc repeat\
			&& mpc play" \
		mT="mpc toggle"
fi

# TPB
if [ -x "$(command -v pirate-get)" ] ; then
	alias tpb="pirate-get"
fi

# MPV
if [ -x "$(command -v mpv)" ] ; then
	alias mpvcp='setsid mpv -quiet "$(oclp)"'
	alias -s gif="mpv --loop"
fi

# BAT
if [ -x "$(command -v bat)" ] ; then
	alias bat="bat -Ppf"
fi

# Prettyping
if [ -x "$(command -v prettyping)" ] ; then
	alias ping="prettyping -nolegend"
fi

# Newsboat
if [ -x "$(command -v newsboat)" ] ; then
	alias rss="newsboat"
fi

# Calcurse
if [ -x "$(command -v calcurse)" ] ; then
	alias c="calcurse"
fi

# Sxiv & Nsxiv
if [ -x "$(command -v sxiv)" ] ; then
	alias ii="sxiv" imv="sxiv -frbt *"
	alias -s  {png,jpg,jpeg}=sxiv
fi

# Gotop
if [ -x "$(command -v gotop)" ] ; then
	alias gotop='gotop --nvidia' gtop='gotop'
fi

# Se 
if [ -x "$(command -v se)" ] ; then
	alias sec="se c" seb="se b" ses="se s"
fi

# Java
if [ -x "$(command -v java)" ] ; then
	alias -s jar="java -jar"
fi

# Bluetooth-CTL
if [ -x "$(command -v bluetoothctl)" ] ; then
	alias \
		bC="bluetoothctl" \
		bCD="bluetoothctl devices" \
		bCC="bluetoothctl connect" \
		bCPN="bluetoothctl power on" \
		bCPF="bluetoothctl power off" \
		bCS="bluetoothctl scan on"
fi

# Git
if [ -x "$(command -v git)" ] ; then
	alias \
		g='git' \
		gC='git commit' \
		gCE='git commit --allow-empty-message -m ""' \
		gS='git status' \
		gA='git add' \
		gST='git stash' \
		gCL='git clone "$(xclip -selection clipboard -o)"' \
		gPL='git pull' \
		gPU='git push'
fi

# Trash-cli
if [ -x "$(command -v trash-put)" ] ; then
	alias \
		tP="trash-put" \
		tI="lf $XDG_DATA_HOME/Trash" \
		tR="trash-remove" \
		tL="trash-list" \
		tE="trash-empty" \
		tU="trash-restore"
fi

# Convert sites into text and open therm in VIM
if [ -x "$(command -v readable)" ] ; then
	mkwdoc(){
		local CPURL=$(xclip -selection clipboard -o)
		readable -l force -p text-content "${CPURL}" | nvim
		readable -l force -p html-content "${CPURL}" | nvim
	}
fi

# Enable VPN
if [ -x "$(command -v nmcli)" ] ; then
	hme(){
		local VPNN MFNP_STATE

		if [ -n "${1}" ] ; then
			VPNN="${1}"
		else
			VPNN="MfNp"
		fi

		MFNP_STATE=$(
			nmcli connection show MfNp \
			| grep VPN.VPN-STATE \
			| rev | cut -d ' ' -f1 | rev
		)

		if [ "$MFNP_STATE" != "connected" ] ; then
			nmcli connection up $VPNN
		else
			nmcli connection down $VPNN
		fi
	}
fi

# Open GO Docs in Pretty Way
if [ -x "$(command -v go)" ] ; then
	gd(){ go doc $@ | lim }
fi

# System-D
if [ -x "$(command -v systemctl)" ] ; then
	alias \
		S='sudo systemctl' \
		SE='sudo systemctl enable' \
		SD='sudo systemctl disable' \
		SS='sudo systemctl start'
fi

# Package Management
if [ -x "$(command -v topgrade)" ] ; then
	alias uA="topgrade"
fi

case "$LOCAL_SYS_DISTRO_ID" in
	"Arch"|"arch"|"ManjaroLinux")
		_pacmanpkgm
		;;
	"Debian"|"Ubuntu")
		_aptpkgm
		;;
	"fedora"|"Fedora")
		_dnfpkgm
		;;
	*)
esac
