# Plugin Config

# run neofetch
fch

## cod (--help autocomplete)
which cod > /dev/null && source <(cod init $$ zsh)

# History-substring-search
if [ -d ${ZPLUGINDIR}//zsh-history-substring-search ]; then
	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
	bindkey -M vicmd 'k' history-substring-search-up
	bindkey -M vicmd 'j' history-substring-search-down
fi

# Autosuggestions
if [ -d ${ZPLUGINDIR}/zsh-autosuggestions ]; then
	ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
	# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
	# bindkey '<M-Space>' autosuggest-accept
fi

# Alias-tips
if [ -d ${ZPLUGINDIR}/alias-tips ]; then
	export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Tip: "  # Customize the Output
	export ZSH_PLUGINS_ALIAS_TIPS_EXPAND=1      # Command Expansion
	export ZSH_PLUGINS_ALIAS_TIPS_FORCE=1       # Force Alias Use
	export ZSH_PLUGINS_ALIAS_TIPS_EXCLUDES=""   # Exclude some Aliases
fi
