#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Starts a loop: the command is invoked until correct session name is typed,
# or until prompt is cancelled with Ctrl-c or Enter.
main() {
	tmux command -p window: "run '$CURRENT_DIR/switch_window_or_loop.sh %1'"
}
main
