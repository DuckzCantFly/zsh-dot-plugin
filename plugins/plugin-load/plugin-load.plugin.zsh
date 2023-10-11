### Load Plugins ###

# Plugins to Load
plugins=(
	zsh-defer # Only put plugins after this one if not needed imedatly at start.
) ; plugin-source ${plugins}

plugins=(
	zsh-completions
	zsh-history-substring-search
	zsh-autosuggestions
	fast-syntax-highlighting
	zsh-autopair
	zsh-system-clipboard
	zsh-you-should-use 
) ; zsh-defer plugin-source ${plugins}

# Load Zsh Bench
export PATH="${ZPLUGINDIR}/zsh-bench:$PATH"
