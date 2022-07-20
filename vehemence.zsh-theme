# Vehemence by H1N1 and tupzikapi
# This is nice minimalistic two-line theme

# Theme shows:
#	Time
#	Return status (if not zero)
#	Name + Host
#	Full path (without "~" as home)
#	History value (how many commands you execute)
#	Indicator for errors (two styles)



# Configuration

indicator=1 # 0 for disable, 1 for check mark and cross, 2 for "OwO" and ">w<"


function inde() {
	local ret=$?
	if [[ $indicator -eq 1 ]]; then
		if [[ $ret -ne 0 ]]; then
			echo '%F{1}✗%f'
		fi
		if [[ $ret -eq 0 ]]; then
			echo '%F{2}✓%f'
		fi
	fi
	if [[ $indicator -eq 2 ]]; then
		if [[ $ret -ne 0 ]]; then
			echo '%F{1}>w<%f'
		fi
		if [[ $ret -eq 0 ]]; then
			echo '%F{2}OwO%f'
		fi
	fi
}

function err() {
	local ret=$?
	if [[ $ret -ne 0 ]]; then
		echo '> %F{9}%?%f <'
	fi
}
rn=$'\r\n'
lfa="%B(%F{6} %n %m %f%F{2}%l%f )%b "   # Left Up 1 (NAME+HOST)
lfb="%B(%F{3} %!%f )" 			# Left Up 2.1 (Commands)
if [[ $indicator -ne 0 ]]; then
	lfbb=' ( $(inde) )%b'		# Left Up 2.2 (Indicator)
else
	lfbb=""				# Left Up 2.2 (Indicator OFF)
fi
lfc="%B%F{13} %d %f%b%# "		# Left Down (Directory)

right='$(err) %B(%F{6} %* %f)%b'
left="$lfa$lfb$lfbb$rn$lfc"

PROMPT=$left
RPROMPT=$right

