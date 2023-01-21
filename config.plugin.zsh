### General Settings ###
autoload -U colors && colors	2>/dev/null # Load colors

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

## History in cache directory:
	### Setup HISTFILE
		ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/"
		HISTFILE=${ZSH_CACHE_DIR}/history

		if [ ! -e "${HISTFILE}" ] ; then
			mkdir -p "${ZSH_CACHE_DIR}" 2> /dev/null \
				&& touch ${HISTFILE}
		fi

	### History config
		HISTSIZE=10000000
		SAVEHIST=10000000

		setopt BANG_HIST              # Treat the '!' character specially during expansion.
		setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
		setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
		setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.

		# setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
		# setopt HIST_BEEP              # Beep when accessing nonexistent history.
		# setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
		# setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
		# setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
		# setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
		# setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
		# setopt HIST_VERIFY            # Don't execute immediately upon history expansion.
		# setopt SHARE_HISTORY          # Share history between all sessions.
