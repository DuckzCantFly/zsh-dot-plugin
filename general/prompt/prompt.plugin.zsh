### Prompt Settings ###

# Update the prompt before each command execution
function _prompt_precmd {
	local red yellow green blue magenta white reset_color

	_prompt_colors

	local user_prompt="${yellow}%n"                     # User
	local hostname_prompt="${green}@${blue}%M"          # Hostname
	local cwd_prompt="${magenta}%(5~|%-1~/.../%3~|%4~)" # Current working directory (truncated)
	local current_time_prompt="${white}%*"              # Current time
	local job_prompt="%(1j.[${yellow}%j${red}].)"       # Job information
	local prompt_symbol="
${red}[${reset_color}${white}\$"

	# Elapsed time
	if [ "${PROMPTTIMER}" ]; then
		local elapsed_time_prompt=" ${blue}$(_prompt_elapsed_format "${PROMPTTIMER}")"  
		unset PROMPTTIMER
	fi

	PS1="%B${red}[${user_prompt}${hostname_prompt} ${cwd_prompt}${red}]"
	PS1+="${job_prompt}"
	PS1+="${red}[${current_time_prompt}${elapsed_time_prompt}${red}]"
	PS1+="${prompt_symbol}"
} ; precmd_functions+=(_prompt_precmd)

# Set color variables
function _prompt_colors {
	red="%{$fg[red]%}"
	yellow="%{$fg[yellow]%}"
	green="%{$fg[green]%}"
	blue="%{$fg[blue]%}"
	magenta="%{$fg[magenta]%}"
	white="%{$fg[white]%}"
	reset_color="%{$reset_color%}"
}

# Initialize the timer for elapsed time calculation
function _prompt_elapsed_preexec {
	PROMPTTIMER=$(($(date +%s%N)/1000000))
} ; preexec_functions+=(_prompt_elapsed_preexec)

# Format a single time part (days, hours, minutes, seconds, milliseconds)
function _prompt_elapsed_shrink {
	local time_value=$1
	local time_label=$2

	if [ "${time_value}" -gt 0 ] && [ "${counter}" -lt 2 ]; then
		elapsed_str+="${time_value}${time_label}"
		 ((counter++))
	fi
}

# Format the elapsed time in the desired format
function _prompt_elapsed_format {
	local elapsed_str days hours minutes seconds milliseconds
	local now=$(($(date +%s%N)/1000000))
	local elapsed=$((${now}-${1}))
	local counter=0

	# Format the elapsed time
	((days=elapsed/86400000))
	((hours=(elapsed/3600000)%24))
	((minutes=(elapsed/60000)%60))
	((seconds=(elapsed/1000)%60))
	((milliseconds=elapsed%1000))

	# Construct the formatted elapsed time string
	_prompt_elapsed_shrink "${days}"         "d"
	_prompt_elapsed_shrink "${hours}"        "h"
	_prompt_elapsed_shrink "${minutes}"      "m"
	_prompt_elapsed_shrink "${seconds}"      "s"
	_prompt_elapsed_shrink "${milliseconds}" "ms"

	echo "${elapsed_str}"
}
