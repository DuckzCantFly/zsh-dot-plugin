plugins=(
	zsh-config-as-plugin/shell/functionrc
	zsh-config-as-plugin/shell/shortcutrc
	zsh-config-as-plugin/shell/aliasrc
) ; plugin-source ${plugins}

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
