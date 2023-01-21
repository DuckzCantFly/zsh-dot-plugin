### Basic Tab Complete ###

fpath=(${ZDOTDIR}/completion $fpath)
autoload -U compinit
# zstyle ':completion:*' menu select
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
#_comp_options+=(globdots)		# Include hidden files.
# local completions
setopt MENU_COMPLETE
