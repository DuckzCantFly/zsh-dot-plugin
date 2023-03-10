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
		pS="p -Ss"\
		pL="p -Qe --info | grep -E 'Name            :|Description     :|Provides        :|Depends On      :|Required By     :|^$' | vim"\
		pLA="p -Q --info | vim"\
		pC="p -c"\
		pU="p -Syu --noconfirm"\

	eval '
		### Open URL "for Arch package"
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

		### Open URL "for Arch package"
		pIF(){
			local ARGS
			if [ -n "$1" ] ; then
				ARGS="$@"
			else
				ARGS=$(xclip -selection clipboard -o)
			fi

			if [ -n "${ARGS}" ] ; then
				p -Qi ${ARGS} || p -Si ${ARGS}
			fi
		}
	'
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
