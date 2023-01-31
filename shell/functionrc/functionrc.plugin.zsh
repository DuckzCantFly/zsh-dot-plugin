### Functions RC ###

# Package Managment
## Debian Package Managment
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

## Arch Package Managment
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

# Open URL "for Arch package"
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

# Auto Folds for Less
lim(){ fold -s -w $(tput cols) ${@} | less }

# Auto Start Tmux on Launch
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

# Copy File's Path
cpfp(){
	if [ -n "$1" ] ; then
		local CPFILE="$@" \
			&& readlink -f "$CPFILE" | tr -d '\n' | xclip -selection clipboard
	fi
}

# Man Alias
man(){
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

# Little thing to open seletion in $BROWSER
webgrb(){ local ARGS="$(xsel)" ; ${BROWSER} "{$ARGS}" }

# Remove Extentions
rmex(){
	local file
	for file in *$1*; do
			mv -- "${file}" "${file%%$1*}"
	done
}

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
