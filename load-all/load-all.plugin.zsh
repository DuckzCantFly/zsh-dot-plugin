### Load All Configuration as Plugins ###

plugins=(
	## User Config
	zsh-dot-plugin/general
	zsh-dot-plugin/shell
	zsh-dot-plugin/general/history
	zsh-dot-plugin/general/tab-complete
	zsh-dot-plugin/general/vi-mode
	zsh-dot-plugin/general/control-keys
	zsh-dot-plugin/general/user-settings
	zsh-dot-plugin/fch
	## Plugins Install & Load
	zsh-dot-plugin/plugins
	## Plugin Config
	zsh-dot-plugin/plugins/plugin-config
	## Plugins Install & Load
	zsh-dot-plugin/plugins/plugin-load
) ; plugin-source ${plugins}
