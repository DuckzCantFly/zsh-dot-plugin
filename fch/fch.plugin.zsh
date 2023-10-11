# "fch", a fork of https://gitlab.com/jschx/ufetch,
# tiny system info for arch, debian, ubuntu, fedora, manjaro, & generic

# Copyright (c) 2015 J Schillinger

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Info
function _fch-info(){
	# user is already defined
	host="$(cat /etc/hostname)"
	kernel="$(uname -sr | cut -d ' ' -f2-)"
	uptime="$(
	  uptime -p \
	  | sed 's/up //;s/ minute./m/g;s/ hour.*, /h/g;s/ day.*, /d/g;s/ year.*, /y/g'
	)"
	shell="$(basename "${SHELL}")"
	packages="$(_fch-packages)"
}

# Fech formatting & colors
function _fch-formating(){
	## You can change these but remember to add formatting as local variables!
	lc="${reset}${bold}${bblack}" # labels
	nc="${reset}${bold}${blue}"   # user and hostname
	ic="${reset}${byellow}"       # info
	## Ascii Colors
	c0="${reset}${bblue}"         # first color
	c1="${reset}${bgreen}"        # second color
	c2="${reset}${bred}"          # second color
}

# Fch Lines
function _fch-lines(){
	## You can change these but remember to add formatting as local variables!
	l1="${lc}|${nc}${kernel}"
	l2="${lc}|${ic}${uptime} ${lc}|${ic}${packages} ${lc}|${ic}${ui} ${lc}|${ic}${shell}"
	l3="${blocknormal}"
	l4="${blockbright}"
}

# Output & Logos
# check alt-logo.txt for more logos and logos and line versions
function _fch-output-fch(){
	case "${sys_distro_id}" in
		"Arch"|"arch")
			cat <<EOF
${c0}   /\\    ${l1}
${c0}  /\` \\   ${l2}
${c0} / {} \\  ${l3}
${c0}/.^\`\`^.\\ ${l4}
EOF
			;;
		"ManjaroLinux")
			cat <<EOF
${c1}█████ ██ ${l1}
${c1}██    ██ ${l2}
${c1}██ ██ ██ ${l3}
${c1}██ ██ ██ ${l4}
EOF
			;;
		"Debian")
			cat <<EOF
${c2}  ,>-<.  ${l1}
${c2}  |  _\\  ${l2}
${c2}  \\.(_/  ${l3}
${c2}   >_    ${l4}
EOF
			;;
		"Ubuntu")
			cat << EOF
${c2}   __O  ${l1}
${c2} /\\\\ _\\ ${l2}
${c2}O  {}-. ${l3}
${c2} \\//_O  ${l4}
EOF
			;;
		"SteamOS")
			cat << EOF
${c0} <-->  ${l1}
${c0}/   O\\ ${l2}
${c0}\\\\// / ${l3}
${c0} <o->  ${l4}
EOF
			;;
		"fedora"|"Fedora")
	cat << EOF
${c0}   /==\\ ${l1}
${c0} /-||   ${l2}
${c0}|| ||=) ${l3}
${c0} \\==/   ${l4}
EOF
			;;
		*)
			cat <<EOF
${c0}   .-.   ${l1}
${c0}   oo|   ${l2}
${c0}  /\`'\\   ${l3}
${c0} (\_;/)  ${l4}
EOF
	esac
}

# Find Package Manager
function _fch-packages(){
	# Add packages managers here
	case ${sys_distro_id} in
		"Ubuntu"|"Debian")
			echo "$(dpkg -l | grep -c '^ii')"
			;;
		"ManjaroLinux"|"Arch"|"arch")
			echo "$(\pacman -Q | wc -l)"
			;;
		"SteamOS")
			echo "$(flatpak list --app | wc -l)"
			;;
		"fedora"|"Fedora")
			echo "$(rpm -qa --nodigest --nosignature | wc -l)"
			;;
		*)
			echo "?"
	esac
}

# Grab Distro ID
function _fch-sys-distro-id(){
	if [ -n "${LOCAL_SYS_DISTRO_ID}" ] ; then
		sys_distro_id=${LOCAL_SYS_DISTRO_ID}
		return
	elif [ -x "$(command -v lsb_release)" ] ; then
		sys_distro_id="$(
			lsb_release -a \
			| grep -i -e "Distributor ID:" \
			| cut -d ':' -f2 \
			| tr -d '[:space:]'
		)"
		return
	elif 
		if ls -U /etc/*release 1>& /dev/null 2>&1 ;then
			sys_distro_id="$(
				cat /etc/*release \
				| grep -m 1 "ID=" \
				| cut -d '=' -f2 \
				| tr -d '[:space:]'
			)"
		else 
			[ 1 = 2 ]
		fi ; [ -n "${sys_distro_id}" ]
	then ; return
	elif 
		if ls -U /etc/issue* 1>& /dev/null ; then
			sys_distro_id="$(
				cat /etc/issue* \
				| cut -d ' ' -f1 \
				| tr -d '[:space:]'
			)"
		else
			[ 1 = 2 ]
		fi ; [ -n "${sys_distro_id}" ]
	then ; return
	else
		sys_distro_id="other"
	fi
}

# UI DETECTION
function _fch-ui-detection(){
	local rcwm="$(_fch-parse_rcs "${HOME}/.xinitrc" "${HOME}/.xsession")"

	if [ -n "${DE}" ]; then
		ui="${DE}"
		uitype='DE'
	elif [ -n "${WM}" ]; then
		ui="${WM}"
		uitype='WM'
	elif [ -n "${XDG_CURRENT_DESKTOP}" ]; then
		ui="${XDG_CURRENT_DESKTOP}"
		uitype='DE'
	elif [ -n "${DESKTOP_SESSION}" ]; then
		ui="${DESKTOP_SESSION}"
		uitype='DE'
	elif [ -n "${rcwm}" ]; then
		ui="${rcwm}"
		uitype='WM'
	elif [ -n "${XDG_SESSION_TYPE}" ]; then
		ui="${XDG_SESSION_TYPE}"
	else
		uitype='Unknown'
		ui='Posabally TTY'
	fi

	ui="$(basename "${ui}")"
}

# DEFINE COLORS
function _fch-define-colors(){
	## probably don't change these
	if [ -x "$(command -v tput)" ]; then
		reset="$(   tput sgr0     2> /dev/null)"
		bold="$(    tput bold     2> /dev/null)"
		black="$(   tput setaf 0  2> /dev/null)"
		red="$(     tput setaf 1  2> /dev/null)"
		green="$(   tput setaf 2  2> /dev/null)"
		yellow="$(  tput setaf 3  2> /dev/null)"
		blue="$(    tput setaf 4  2> /dev/null)"
		magenta="$( tput setaf 5  2> /dev/null)"
		cyan="$(    tput setaf 6  2> /dev/null)"
		white="$(   tput setaf 7  2> /dev/null)"
		bblack="$(  tput setaf 8  2> /dev/null)"
		bred="$(    tput setaf 9  2> /dev/null)"
		bgreen="$(  tput setaf 10 2> /dev/null)"
		byellow="$( tput setaf 11 2> /dev/null)"
		bblue="$(   tput setaf 12 2> /dev/null)"
		bmagenta="$(tput setaf 13 2> /dev/null)"
		bcyan="$(   tput setaf 14 2> /dev/null)"
		bwhite="$(  tput setaf 15 2> /dev/null)"
	fi
	blockbright="${reset}${bblack}███${bred}███${bgreen}███${byellow}███${bblue}███${bmagenta}███${bcyan}███${bwhite}███"
	blocknormal="${reset}${black}███${red}███${green}███${yellow}███${blue}███${magenta}███${cyan}███${bwhite}███"
}

# Check for wm in configs
function _fch-parse_rcs(){
	local wm
	for f in "${@}"; do
		wm="$(tail -n 1 "${f}" 2> /dev/null | cut -d ' ' -f 2)"
		[ -n "${wm}" ] && echo "${wm}" && return
	done
}

# Main
function fch(){
	## Local Vars
	local sys_distro_id
	local host kernel uptime packages shell
	local ui uitype
	local reset bold blocknormal blockbright
	local black red green yellow blue magenta cyan white
	local bblack bred bgreen byellow bblue bmagenta bcyan bwhite
	local lc nc ic c0
	local l1 l2 l3 l4

	## Set Distro
	_fch-sys-distro-id
	# sys_distro_id=""

	## Set Info
	_fch-info

	## Set UI
	_fch-ui-detection

	## Set Colors Names
	_fch-define-colors

	## Set Formating Options
	_fch-formating

	## Set Lines
	_fch-lines

	## Output fech and logo
	_fch-output-fch
}
