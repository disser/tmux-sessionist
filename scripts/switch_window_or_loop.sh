#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

WINDOW_NAME="$1"

source "$CURRENT_DIR/helpers.sh"

dismiss_window_list_page_from_view() {
	tmux send-keys C-c
}

window_name_not_provided() {
	[ -z "$WINDOW_NAME" ]
}

main() {
	if window_name_not_provided; then
		dismiss_window_list_page_from_view
		exit 0
	fi

	for SESSION_NAME in $(sh "$CURRENT_DIR/list_sessions.sh")
	do
		if window_exists; then
			dismiss_window_list_page_from_view
			tmux switch-client -t "$SESSION_NAME"
			tmux select-window -t "$WINDOW_NAME"
			exit 0
		fi
	done

	"$CURRENT_DIR/show_goto_window_prompt.sh" "$WINDOW_NAME"
}

main
