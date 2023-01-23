# Plugins To Download
repos=(
	git@github.com:
	romkatv/zsh-defer
	romkatv/zsh-bench
	zsh-users/zsh-completions
	zsh-users/zsh-history-substring-search
	zsh-users/zsh-autosuggestions
	zdharma-continuum/fast-syntax-highlighting
	hlissner/zsh-autopair
	djui/alias-tips
	kutsan/zsh-system-clipboard
) ; plugin-clone ${repos}

# Plugins to load
plugins=(
	zsh-defer # Only put plugins after this one if not needed imedatly at start.
	zsh-completions
	zsh-history-substring-search
	zsh-autosuggestions
	fast-syntax-highlighting
	zsh-autopair
	alias-tips
	zsh-system-clipboard
) ; plugin-source ${plugins}

# Load Zsh Bench
# export PATH="${ZPLUGINDIR}/zsh-bench:$PATH"
