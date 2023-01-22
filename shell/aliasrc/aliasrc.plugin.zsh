# Use neovim for vim if present.
if [ -x "$(command -v nvim)" ] ; then
	alias vim="nvim" vimdiff="nvim -d"
fi

# Use $XINITRC variable if file exists.
if [ -f "$XINITRC" ] ; then
	alias startx="startx $XINITRC"
fi

# Change lf to lf uberzug
if which lfub > /dev/null ; then
	alias lf="lfub"
fi

# sudo not required for some system commands
for command in mount umount sv pacman updatedb su shutdown poweroff reboot ; do
	alias $command="sudo $command"
done; unset command

# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -Iv" \
	bc="bc -ql" \
	mkd="mkdir -pv" \
	yt="youtube-dl --add-metadata -i" \
	yta="yt -x -f bestaudio/best" \
	ffmpeg="ffmpeg -hide_banner"

# Colorize commands when possible.
alias \
	ls="exa --icons -hn --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi"\
	ip="ip -color=auto"

# These common commands are just too long! Abbreviate them.
alias \
	ka="killall" \
	trem="transmission-remote" \
	YT="pipe-viewer" \
	sdn="shutdown -h now" \
	f="$FILE" \
	e="$EDITOR" \
	v="$EDITOR" \
	xi="sudo xbps-install" \
	xr="sudo xbps-remove -R" \
	xq="xbps-query" \
	z="zathura"

alias \
	magit="nvim -c MagitOnly" \
	ref="shortcuts >/dev/null; source ${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc ; source ${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" \
	weath="less -S ${XDG_DATA_HOME:-$HOME/.local/share}/weatherreport" \
	tmux="tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" \

# Cstm_Alias
	# gen
	alias \
		rss="newsboat" \
		ii="sxiv" \
		ping="prettyping -nolegend" \
		":q!"="exit" \
		":q"="exit" \
		":wq"="exit" \
		info="info --vi-keys" \
		bat="bat -Ppf" \
		la="ls -lah" \
		ll="ls -lh" \
		lg="la | grep" \
		lsr="ls -lah --tree --color=always | less" \
		qclp="tr -d '\n' | xclip -selection clipboard" \
		oclp="xclip -selection clipboard -o" \
		cpwd="pwd | qclp " \
		neo="clear && fch" \
		neofetch="clear && fastfetch" \
		ipaddr="curl ifconfig.me" \
		lipaddr='ip address | grep "inet " '\
		gotop='gotop --nvidia'\
		gtop='gotop'\
		sec="se c"\
		seb="se b"\
		ses="se s"\
		l="linkhandler"\
		s="sudo " \
		imv="sxiv -frbt *" \
		sudo="sudo " \
		szrc="source $XDG_CONFIG_HOME/zsh/.zshrc ; source $HOME/.profile" \
		mpvcp='setsid mpv -quiet "$(oclp)"' \
		flsz="du -hs * | sort -h" \
		mp="mpc clear \
			&& mpc load default \
			&& mpc shuffle \
			&& mpc repeat\
			&& mpc play" \
		mT="mpc toggle" \
		tpb="pirate-get" \


	#bluetooth
	alias \
		bC="bluetoothctl" \
		bCD="bluetoothctl devices" \
		bCC="bluetoothctl connect" \
		bCPN="bluetoothctl power on" \
		bCPF="bluetoothctl power off" \
		bCS="bluetoothctl scan on" \

	#git
	alias \
		g='git' \
		gC='git commit' \
		gCE='git commit --allow-empty-message -m ""' \
		gS='git status' \
		gA='git add' \
		gST='git stash' \
		gCL='git clone "$(xclip -selection clipboard -o)"' \
		gPL='git pull' \
		gPU='git push' \

	#Trash-cli
	alias \
		tP="trash-put" \
		tI="lf $XDG_DATA_HOME/Trash" \
		tR="trash-remove" \
		tL="trash-list" \
		tE="trash-empty" \
		tU="trash-restore" \

	# system ctl
	alias \
		S='s systemctl' \
		SE='S enable' \
		SD='S disable' \
		SS='S start' \

	# package manager
	alias \
		uA="topgrade"

	case "$SYS_DISTRO_ID" in
		"Arch")
			alias p="paru --bottomup"
			_archpkgm
			;;
		"ManjaroLinux")
			alias p="yay "
			_archpkgm
			;;
		"Debian"|"Ubuntu")
			_debpkgm
			;;
		*)
	esac

# Extention map
alias -s \
	jar="java -jar"\
	pdf="zathura"\
	{mkv,mp4,wedm,avi,mov}=l\
	gif="mpv --loop"\
	{png,jpg,jpeg}=sxiv\
