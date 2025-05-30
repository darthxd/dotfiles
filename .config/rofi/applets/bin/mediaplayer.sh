#!player/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : MPD (music)

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements

prompt="Media Player"

if playerctl status > /dev/null; then
	# prompt="`playerctl metadata artist`"
	mesg="`playerctl metadata title`"
else
	mesg="Nothing is playing"
fi

list_col='1'
list_row='4'

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1=" Play /  Pause"
	option_2=" Previous"
	option_3=" Next"
	option_4=" Stop"
else
	option_1="/"
	option_2=""
	option_3=""
	option_4=""
fi

# Toggle Actions
active=''
urgent=''
# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: " ";}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		${active} ${urgent} \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		playerctl play-pause
	elif [[ "$1" == '--opt2' ]]; then
		playerctl previous
	elif [[ "$1" == '--opt3' ]]; then
		playerctl next
	elif [[ "$1" == '--opt4' ]]; then
		playerctl stop
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
		run_cmd --opt4
        ;;
    $option_5)
		run_cmd --opt5
        ;;
    $option_6)
		run_cmd --opt6
        ;;
esac
