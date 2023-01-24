### plugin-loader ###
# A bootstrap plugin manager in less then 100 lines based on mattmc3/zsh_unplugged.

# Dev Functions
## Update Checker
function _plugin-update-check {
	local d u gitlcl gitrmt
	for d in ${ZPLUGINDIR}/*/.git(/); do
		gitlcl=$(git -C "${d:h}" rev-parse HEAD)
		gitrmt=$(git -C "${d:h}" ls-remote origin HEAD | awk '{ print $1 }')
		if [ "${gitlcl}" != "${gitrmt}" ] ; then
			export u="${u} ${d:h}"
		fi
	done
	echo ${u}
}

## Speed Up Plugins
function _plugin-speed-up {
	for f in "${1}"/*.zsh{,-theme}(N); do
		zrecompile -pq "${f}"
	done
}

# User callable functions
## Clone Uninstalled Plugins
function plugin-clone {
	local f plugdir initfile repo repos_source
	repos_source=$(echo ${@} | cut -d ' ' -f1)
	autoload -U zrecompile
	for repo in $(echo ${@} | cut -d ' ' -f2-) ; do
		plugdir=${ZPLUGINDIR}/${repo:t}
		initfile=${plugdir}/${repo:t}.plugin.zsh
		if [[ ! -d ${plugdir} ]]; then
			echo "Cloning ${repo}..."
			git clone -q --depth 1 --recursive --shallow-submodules "${repos_source}/${repo}" "${plugdir}"
			[ "${ZPLUGSPEED}" = "true" ] && _plugin-speed-up
		fi
		if [[ ! -e ${initfile} ]]; then
			local -a initfiles=(${plugdir}/*.plugin.{z,}sh(N) ${plugdir}/*.{z,}sh{-theme,}(N))
			(( $#initfiles )) && ln -sf "${initfiles[1]}" "${initfile}"
		fi
	done
}

## Update Repositories, if need
function plugin-update {
	local d  f
	autoload -U zrecompile
	for d in $(_plugin-update-check) ; do
		echo "Updating ${d:h:t}..."
		git -C "$d:h" pull --ff --recurse-submodules --depth 1 --rebase --autostash
		[ "${ZPLUGSPEED}" = "true" ] && _plugin-speed-up
	done
}


## Load Plugins
function plugin-source {
	local plugdir
	for plugdir in ${@} ; do
		[[ ${plugdir} = /* ]] || plugdir=${ZPLUGINDIR}/${plugdir}
		fpath+=${plugdir}
		local initfile=${plugdir}/${plugdir:t}.plugin.zsh
		(( $+functions[zsh-defer] )) && zsh-defer . ${initfile} || . ${initfile}
	done
}

## Manually Compile All Plugins
function plugin-compile {
	if [ "${ZPLUGSPEED}" = "true" ] ; then
		ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
		autoload -U zrecompile
		local f
		for f in $ZPLUGINDIR/**/*.zsh{,-theme}(N); do
			zrecompile -pq "$f"
		done
	else
		echo '$ZPLUGSPEED is not set to "true", set to "true" this function'
	fi
}
