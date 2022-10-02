# Vehemence by H1N1 and tupzikapi
# This is nice minimalistic two-line theme

# Theme shows:
#	Time
#	Return status (if not zero)
#	Name + Host
#	Full path (without "~" as home)
#	History (how many commands you execute)
#	Indicator for errors (two styles)
#       Jobs running
#


# Configuration

indicator=1 # 0 for disable, 1 for check mark and cross, 2 for "OwO" and ">w<"
histk=0 # 0 for disable, 1 for enable history size.
timek=0 # 0 for disable, 1 for show time.
errork=0 # 1 for show error code.
jobsk=0 # 1 for show, how many jobs you have running.

function inde() {
	local ret=$?
	if [[ $indicator -eq 1 ]]; then
		if [[ $ret -ne 0 ]]; then
			echo '%F{1}X%f'
		fi
		if [[ $ret -eq 0 ]]; then
			echo '%F{2}V%f'
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
		if [[ $errork -ne 0 ]]; then
			echo '> %F{9}%?%f <'
		fi
	fi
}
function jobber(){
	if [[ $jobsk -ne 0 ]]; then
		echo '%(1j.%B(%F{4} J:%j%f )%b.)' # Please.. how to understand it..
	fi
}
	
local rn=$'\r\n'
local lfa="%B(%F{6} %n %m %f%F{2}%l%f )%b "   # Left Up 1 (NAME+HOST+TTY)
if [[ $histk -ne 0 ]]; then
	local lfb="%B(%F{3} %!%f )%b" 			# Left Up 2.1 (Commands)
else
	local lfb=""
fi
if [[ $indicator -ne 0 ]]; then
	local lfbb=' %B( $(inde) )%b'		# Left Up 2.2 (Indicator)
else
	local lfbb=""				# Left Up 2.2 (Indicator OFF)
fi

if [[ $jobsk -ne 0 ]]; then
	local lfbb=$lfbb' $(jobber)'		# Left Up 2.2 (Indicator)
fi
local lfc="%B%F{13} %d %f%b%# "		# Left Down (Directory)

if [[ $timek -ne 0 ]]; then
	local right='$(err) %B(%F{6} %* %f)%b' # Right Up
else
	local right='$(err)'
fi
local left="$lfa$lfb$lfbb$rn$lfc"

PROMPT=$left
RPROMPT=$right
