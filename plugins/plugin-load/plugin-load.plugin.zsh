### Load Plugins ###

# Plugins to Load
plugins=(
	zsh-defer # Only put plugins after this one if not needed imedatly at start.
	zsh-completions
	zsh-history-substring-search
	zsh-autosuggestions
	fast-syntax-highlighting
	zsh-autopair
	alias-tips
	zsh-system-clipboard
	theprimeagen/vim-be-good
) ; plugin-source ${plugins}

# Load Zsh Bench
# export PATH="${ZPLUGINDIR}/zsh-bench:$PATH"
