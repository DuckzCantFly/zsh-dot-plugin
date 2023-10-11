### Functions RC ###

# Package Managment
## Debian Package Managment
_aptpkgm(){
	if [ -x "$(command -v apt)" ] ; then
		alias pkm="apt"
	else
		alias pkm="apt-get"
	fi

	alias \
		p='pkm search' \
		pI='sudo pkm install' \
		pIF='pkm info' \
		pL='apt-mark showmanual | vim' \
		pLA='pkm list --installed | vim' \
		pR='sudo pkm remove' \
		pC='sudo pkm autoremove' \
		pU='sudo pkm update && pkm upgrade' \
		u='pU' 
}

## Debian Package Managment
_dnfpkgm(){
	if [ -x "$(command -v dnf)" ] ; then
		alias pkm="dnf"
		if ! [ -x "$(command -v yum)" ] ; then
			alias yum="dnf"
		fi
	else
		alias pkm="yum"
	fi

	alias \
		p='pkm search' \
		pI='sudo pkm install' \
		pIF='pkm info' \
		pL='pkm list | vim' \
		pLA='pkm info | vim' \
		pR='sudo pkm remove' \
		pC='sudo pkm autoremove' \
		pU='sudo pkm update' 
}

## Arch Package Mhanagment
_pacmanpkgm(){
	if [ -x "$(command -v paru)" ] ; then
		alias p="paru" \
					pkm="paru" \
					pkmsu="paru"
	elif [ -x "$(command -v yay)" ] ; then
		alias p="yay" \
					pkm="yay" \
					pkmsu="yay"
	else
		alias p="pacman -Ss" \
					pkm="pacman" \
					pkmsu="sudo pacman"
	fi

	alias \
		pR="pkmsu -Rns"\
		pI="pkmsu -S --noconfirm"\
		pIN="pkmsu -S --noconfirm --needed"\
		pS="pkm -Ss"\
		pL="pkm -Qe --info | grep -E 'Name            :|Description     :|Provides        :|Depends On      :|Required By     :|^$' | vim"\
		pLA="pkm -Q --info | vim"\
		pC="pkmsu -Yc"\
		pU="pkmsu -Syu --noconfirm"\

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
				pkm -Qi ${ARGS} || pkm -Si ${ARGS}
			fi
		}
	'
}

# Auto Folds for Less
lim(){ fold -s -w $(tput cols) ${@} | less }

# Auto Start Tmux on Launch
autotmux(){
	if [ -n "$(command -v tmux)" ] && [ -z "$TMUX"  ] ; then
		local tmuxconfig="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"
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
		local CPFILE="$@"
		readlink -f "$CPFILE" \
			| tr -d '\n' \
			| xclip -selection clipboard
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
