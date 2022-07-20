# Vehemence by H1N1 and tupzikapi
# This is nice two-line theme, without useless things like git.
# Also, is a tty-friendly :)

# Theme shows:
#	Time
#	Return status (if not zero)
#	Name + Host
#	Full path (without "~" as home)
#	Time to execute command (need plugin)
#	History value (how many commands you execute)
#	Cute face indicator (Seems to be more suitable for furries)


# Deps:

#	 Execute time: 		popstas/zsh-command-time


# Configuration

owo_face=1 # Enable(1) for face indicator


function owo() {
	local ret=$?
	if [[ $ret -ne 0 ]]; then
		echo '%F{1}>w<%f'
	fi
	if [[ $ret -eq 0 ]]; then
		echo '%F{2}OwO%f'
	fi
}

function err() {
	local ret=$?
	if [[ $ret -ne 0 ]]; then
		echo '> %F{7}%?%f <'
	fi
}
rn=$'\r\n'
lfa="%B(%F{6} %n %m %f%F{2}%l%f )%b "   # Left Up 1 (NAME+HOST)
lfb="%B(%F{3} %!%f )" 			# Left Up 2.1 (Commands)
if [[ $owo_face -eq 1 ]]; then
	lfbb=' ( $(owo) )%b'		# Left Up 2.2 (Indicator)
else
	lfbb=""				# Left Up 2.2 (Indicator OFF)
fi
lfc="%B%F{13} %d %f%b%# "		# Left Down (Directory)

right='$(err) %B(%F{6} %* %f)%b'
left="$lfa$lfb$lfbb$rn$lfc"

PROMPT=$left
RPROMPT=$right

