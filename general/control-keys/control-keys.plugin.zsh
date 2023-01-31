### Control Keys ###

# Use lf to switch directories and bind it to ctrl-o
if which cf > /dev/null ; then
	bindkey -s '^o' '^ucf\n'
fi

# Use fzf to find files and bind it to ctrl-o
if which fzf > /dev/null ; then
	bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'
fi

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete
