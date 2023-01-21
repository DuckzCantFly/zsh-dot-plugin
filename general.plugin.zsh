### General Settings ###
autoload -U colors && colors	2>/dev/null # Load colors

# Grab Distro ID
if lsb_release 1> /dev/null 2>&1 ; then
	export SYS_DISTRO_ID="$(lsb_release -a | grep "-e Distributor ID:" | cut -d ':' -f2 | tr -d '[:space:]')"
elif ls -U /etc/*release 1> /dev/null 2>&1 ; then
	export SYS_DISTRO_ID="$(cat /etc/*release | grep DISTRIB_ID | cut -d '=' -f2 | tr -d '[:space:]')"
elif ls -U /etc/issue* 1> /dev/null 2>&1 ; then
	export SYS_DISTRO_ID="$(cat /etc/issue* | cut -d ' ' -f1 | tr -d '[:space:]')"
else
	export SYS_DISTRO_ID="other"
fi

## Set ZDOTDIR
if [ -z "${ZDOTDIR}" ] ; then
	ZDOTDIR=${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}
	mkdir -p "${ZDOTDIR}" 2> /dev/null
fi

#Prompt
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]
[%{$reset_color%}$%b "

# Basics
setopt autocd		            # Automatically cd into typed directory.
setopt auto_pushd	          # Automatically adds cd to stack.
setopt interactive_comments # allow interactive comments
stty stop undef		          # Disable ctrl-s to freeze terminal.
