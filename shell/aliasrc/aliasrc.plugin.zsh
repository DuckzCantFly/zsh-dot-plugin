### Alias ###

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

## Colorize commands when possible.
alias \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ip="ip -color=auto"

## LS
alias \
	ls="ls -hn --color=auto --group-directories-first" \
	la="ls -lah" \
	ll="ls -lh" \
	lg="la | grep" \
	lsr="ls -lah --tree --color=always | less" \

# Shorten up Commands
alias \
	s="sudo" \
	neo="clear && fch" \
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

# Extension Mappings
alias -s \
	jar="java -jar"\
	pdf="zathura"\
	{mkv,mp4,wedm,avi,mov}=l\
	gif="mpv --loop"\
	{png,jpg,jpeg}=sxiv\
