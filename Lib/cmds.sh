#!/bin/bash
clipboard_manager() {
	result=$(cliphist list | fzf --reverse -m)
	echo "$result" | while read -r line; do
		printf "$line" | cliphist delete
	done
}
$1
