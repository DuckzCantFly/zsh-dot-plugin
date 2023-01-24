### Basic Tab Complete ###

fpath=(${ZDOTDIR}/completion $fpath)
autoload -U compinit ; compinit -i
setopt MENU_COMPLETE
zmodload zsh/complist
eval "$(dircolors)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#_comp_options+=(globdots)		# Include hidden files.
# local completions
