### Shell ###
# Load Plugins
plugins=(
	zsh-dot-plugin/shell/functionrc
	zsh-dot-plugin/shell/user-settings
	zsh-dot-plugin/shell/optrc
	zsh-dot-plugin/shell/aliasrc
	zsh-dot-plugin/shell/shortcutrc
) ; plugin-source ${plugins}

# Link shell RCS
function linkshellrcs(){
	local shellrcdir shellrc plugshellrc
	local plugshelldir="${ZPLUGINDIR}/zsh-config-as-plugin/shell/"
	local homeshelldir="${XDG_CONFIG_HOME:-${HOME}/config}/shell"

	if [ ! -d ${homeshelldir} ]; then
		mkdir -p "${homeshelldir}" 2> /dev/null
	fi

	for shellrcdir in $(find "${plugshelldir}" -type d -mindepth 1 2>/dev/null) ; do
		shellrc="$(basename ${shellrcdir})"
		if [ ! -e ${homeshelldir}/${shellrc} ] ; then
			ln -s ${shellrcdir}/$shellrc.plugin.zsh ${homeshelldir}/$shellrc
		fi
	done
}
