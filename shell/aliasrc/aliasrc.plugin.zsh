### Alias RC ###

# Make SUDO not required for some system commands
for command in mount umount sv pacman updatedb su shutdown poweroff reboot ; do
	alias $command="sudo $command"
done; unset command

# Better Default options
alias \
	sudo="sudo " \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -Iv" \
	bc="bc -ql" \
	mkd="mkdir -pv" \
	info="info --vi-keys" \

# Colorize commands when possible.
alias \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ip="ip -color=auto"

# LS / EXA / eza
if [ -x "$(command -v eza)" ] ; then
	alias \
		eza="eza --icons -hg --color=auto --group-directories-first" \
		exa="eza" \
		ls="eza"
elif [ -x "$(command -v exa)" ] ; then
	alias \
		exa="exa --icons -hg --color=auto --group-directories-first" \
		ls="exa"
else
	alias ls="ls -hg --color=auto --group-directories-first"
fi

alias \
	la="ls -la" \
	ll="ls -l" \
	lg="la | grep" \
	lsr="ls -la --tree --color=always | less"

# Shorten up Commands
alias \
	s="sudo" \
	dus="du -hs * | sort -h" \
	ka="killall" \
	sdn="shutdown -h now" \
	e="$EDITOR" \
	v="$EDITOR" \
	ipaddr="curl ifconfig.me" \
	lipaddr='ip address | grep "inet " '\

# Move Configs to $XDG_CONFIG_HOME
alias \
	tmux="tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" \

# Vi Exit
alias \
	":q!"="exit" \
	":q"="exit" \
	":wq"="exit" \

# Refresh
alias \
	szrc="source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc \
		; source $HOME/.profile" \
