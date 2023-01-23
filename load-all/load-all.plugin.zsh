### Load All Configuration as Plugins ###

plugins=(
	## User Config
	zsh-config-as-plugin/general
	zsh-config-as-plugin/general/history
	zsh-config-as-plugin/general/tab-complete
	zsh-config-as-plugin/general/vi-mode
	zsh-config-as-plugin/general/control-keys
	zsh-config-as-plugin/shell
	zsh-config-as-plugin/fch
	## Plugins Install & Load
	zsh-config-as-plugin/plugins
	## Plugin Config
	zsh-config-as-plugin/plugins/plugin-config
	## Plugins Install & Load
	zsh-config-as-plugin/plugins/plugin-load
) ; plugin-source ${plugins}
