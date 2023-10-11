### Plugin Config ###

# Cod (--help autocomplete)
if [ -x "$(command -v cod)" ] ; then
	source <(cod init $$ zsh)
fi

# History-substring-search
if [ -d ${ZPLUGINDIR}/zsh-history-substring-search ]; then
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

# You-Should-Use 
if [ -d ${ZPLUGINDIR}/zsh-you-should-use ]; then
	export YSU_MESSAGE_POSITION="after"	# Display after output 
	# export YSU_MODE=ALL									# Display all matches, default: BESTMATCH
	# export YSU_HARDCORE=1								# Force use of aliase

	# YSU msg componets
	start="\e[0m${fg_bold[red]}]\e[0m"
	error="${fg[red]}%command\e[0m"
	fix="${fg_bold[green]}%alias\e[0m"
	arrow="->"

	# YSU msg
	export YSU_MESSAGE_FORMAT="${start} ${error} ${arrow} ${fix}"

	export YSU_IGNORED_ALIASES=(
		nvim
	) # Disaable on commands
fi
