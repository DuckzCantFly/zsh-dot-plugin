### Nyae Correction ###

# enable correction
setopt CORRECT

function _correction-prompt-elements(){
	nl="\e[0m${fg[blue]}"
	nb="${fg_bold[blue]}"
	start="\e[0m${fg_bold[red]}]\e[0m"
	error="${fg[red]}%R\e[0m"
	fix="${fg_bold[green]}%r\e[0m"
	arrow="->"
	errormsg="${fg[red]}Syntax Error:\e[0m"
}

function _correction-prompt-verbose(){
	local nl nb start error fix arrow errormsg
	_correction-prompt-elements
	# local nyae="${nl}${nb}(N)${nl}o${nb}(y)${nl}es${nb}(a)${nl}ll${nb}(e)${nl}dit\e[0m"
	# local nyae="${nl}(${nb}N${nl})o(${nb}y${nl})es(${nb}a${nl})ll(${nb}e${nl})dit\e[0m"
	local nyae="${nl}${nb}N${nl}o|${nb}y${nl}es|${nb}a${nl}ll|${nb}e${nl}dit\e[0m"
	_sprompt="${start} ${errormsg} Replace '${error}' with '${fix}' [${nyae}]: "
	SPROMPT="$( echo ${_sprompt} )"
}

function _correction-prompt-medium(){
	local nl nb start error fix arrow errormsg
	_correction-prompt-elements
	# local nyae="${nl}(${nb}N${nl})(${nb}y${nl})(${nb}a${nl})(${nb}e${nl})\e[0m"
	local nyae="${nb}N${nl}|${nb}y${nl}|${nb}a${nl}|${nb}e\e[0m"
	# local nyae="${nb}Nyae\e[0m"
	_sprompt="${start} Replace '${error}' with '${fix}' [${nyae}]: "
	# local sprompt="${start} '${error}' ${arrow} '${fix}' [${nyae}]: "
	# local sprompt="${start} Replace '${error}' '${fix}'?: "
	SPROMPT="$( echo ${_sprompt} )"
}

function _correction-prompt-short(){
	local nl nb start error fix arrow errormsg
	_correction-prompt-elements
	# local sprompt="${start}\"${error}\" ${arrow} \"${fix}\": "
	# local sprompt="${start}'${error}' ${arrow} '${fix}': "
	_sprompt="${start} ${error} ${arrow} ${fix}: "
	SPROMPT="$( echo ${_sprompt} )"
}

function _correction-set(){
	case "${ZSH_DOT_CONFIG_CORRECTION}" in
		verbose)	_correction-prompt-verbose ;;
		medium)		_correction-prompt-medium ;;
		short)		_correction-prompt-short ;;
		*)
	esac
} ; _correction-set
