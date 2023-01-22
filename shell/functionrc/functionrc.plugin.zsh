### functionss ###

# Arch package managment
_archpkgm(){
		alias \
			pR="p -Rns"\
			pI="p -S --noconfirm"\
			pIN="p -S --noconfirm --needed"\
			pIF="p -Qi"\
			pIR="p -Si"\
			pS="p -Ss"\
			pL="p -Qe --info | vim"\
			pLA="p -Q --info | vim"\
			pC="p -c"\
			pU="p -Syu --noconfirm"\
}

# debian package managment
_debpkgm(){
		alias \
			p='apt search' \
			pI='apt install' \
			pIF='apt info' \
			pL='apt-mark showmanual | vim' \
			pLA='apt list --installed | vim' \
			pR='apt remove' \
			pC='apt autoremove' \
			pU='apt update && apt upgrade' \
			u='apt update && apt upgarde' \
}

# auto start tmux on launch
autotmux(){
	local tmuxconfig="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"
	if [ -z "$TMUX"  ] ; then
		{
			tmux -f ${tmuxconfig} attach \
			|| exec tmux -f ${tmuxconfig} new-session \
			&& exit;
		}
	fi
}

# Copy file path
cpfp(){
	if [ -n "$1" ] ; then
		local CPFILE="$@" \
			&& readlink -f "$CPFILE" | tr -d '\n' | xclip -selection clipboard
	fi
}

# Enable VPN
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

# open go docs is pretty way
gd(){
	go doc $@ | lim
}

# Man alias
man() {
	local PAGER
	env \
		LESS_TERMCAP_md=$(tput bold; tput setaf 4) \
		LESS_TERMCAP_me=$(tput sgr0) \
		LESS_TERMCAP_mb=$(tput blink) \
		LESS_TERMCAP_us=$(tput setaf 2) \
		LESS_TERMCAP_ue=$(tput sgr0) \
		LESS_TERMCAP_so=$(tput smso) \
		LESS_TERMCAP_se=$(tput rmso) \
		PAGER="${commands[less]:-$PAGER}" \
		man "$@"
}

# littler thing to open seletion in firefix i think
webgrb(){
	local ARGS="$(xsel)"
	$BROWSER "$ARGS"
}

# convert sites into text and open therm in vim
mkwdoc(){
	local CPURL=$(xclip -selection clipboard -o)
	readable -l force -p text-content "$CPURL" | nvim
	readable -l force -p html-content "$CPURL" | nvim
}

# open url "for arch package"
pGU(){
	local ARGS
	if [ -n "$1" ] ; then
		ARGS="$@"
	else
		ARGS=$(xclip -selection clipboard -o)
	fi

	for PKGNAME in ${ARGS} ; do
		${BROWSER} "$( pIR ${PKGNAME} | grep URL | cut -d " " -f15 )"
	done
}

# auto folds for less
lim(){
	fold -s -w $(tput cols) ${@} | less
}


# little thing to remove extentions
rmex(){
	local file
	for file in *$1*; do
			mv -- "$file" "${file%%$1*}"
	done
}
