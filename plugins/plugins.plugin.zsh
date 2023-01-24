### Download Plugins ###

# Plugins To Download
repos=(
	https://github.com/
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
