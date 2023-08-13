### General Settings ###
autoload -U colors && colors	2>/dev/null # Load colors

# Grab Distro ID

if [ -n "${SYS_DISTRO_ID}" ] ; then
elif [ -x "$(command -v lsb_release)" ] ; then
	SYS_DISTRO_ID="$(lsb_release -a | grep -e "Distributor ID:" | cut -d ':' -f2 | tr -d '[:space:]')"
elif 
	if ls -U /etc/*release 1>& /dev/null ;then
		SYS_DISTRO_ID="$(cat /etc/*release | grep DISTRIB_ID | cut -d '=' -f2 | tr -d '[:space:]')"
	else 
		[ 1 = 2 ]
	fi ; [ -n "${SYS_DISTRO_ID}" ]
then
elif 
	if ls -U /etc/issue* 1>& /dev/null ; then
		SYS_DISTRO_ID="$(cat /etc/issue* | cut -d ' ' -f1 | tr -d '[:space:]')"
	else
		[ 1 = 2 ]
	fi ; [ -n "${SYS_DISTRO_ID}" ]
then
else
	SYS_DISTRO_ID="other"
fi

## Set ZDOTDIR
if [ -z "${ZDOTDIR}" ] ; then
	ZDOTDIR=${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}
	mkdir -p "${ZDOTDIR}" 2> /dev/null
fi

# Basics
setopt autocd		            # Automatically cd into typed directory.
setopt auto_pushd	          # Automatically adds cd to stack.
setopt interactive_comments # allow interactive comments
stty stop undef		          # Disable ctrl-s to freeze terminal.
