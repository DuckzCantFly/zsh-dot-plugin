### Load All Configuration as Plugins ###

# Autocompile Plugins
ZPLUGSPEED="true"
ZSH_DOT_CONFIG_CORRECTION="short"

# Load everything
plugins=(
	## User Config
	zsh-dot-plugin/general
	zsh-dot-plugin/general/prompt
	zsh-dot-plugin/fch
	zsh-dot-plugin/shell
	zsh-dot-plugin/general/history
	zsh-dot-plugin/general/tab-complete
	zsh-dot-plugin/general/vi-mode
	zsh-dot-plugin/general/control-keys
	zsh-dot-plugin/general/correction
	## Plugins Install & Load
	zsh-dot-plugin/plugins
	## Plugins Install & Load
	zsh-dot-plugin/plugins/plugin-load
	## Plugin Config
	zsh-dot-plugin/plugins/plugin-config
) ; plugin-source ${plugins}
