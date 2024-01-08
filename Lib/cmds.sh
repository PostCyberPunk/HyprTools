#!/bin/bash
# hpdp= hyprctl dispatch
get_active_workspace() {
	return $(hyprctl -j clients | jq -c '.id')
}
hl_notify() {
	hyprctl notify -1 1000 "rgb(ff1ea3)" "$1"
}
clipboard_manager() {
	result=$(cliphist list | fzf --reverse -m)
	echo "$result" | while read -r line; do
		printf "$line" | cliphist delete
	done
}
toggle_term() {
	result=$(hyprctl -j clients | jq -c '.[] | select(.initialTitle == "FTQCT") | .pid')
	if [[ -z $result ]]; then
		kitty -T "FTQCT" --class floating &
		exit 0
	else
		hyprctl dispatch togglespecialworkspace FTQCT
	fi
}
if [[ ! -z "$1" ]]; then
	$1 "${@:2}"
fi
