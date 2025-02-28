#!/bin/bash

tmx () {
    # If no session name provided, use the basename of the current working directory
    local session_name="${1:-$(basename "$(pwd)")}"
    local zoom_pane="${2:-1}"  # Default to zooming pane 1 (where nvim opens)

    # Use -d to allow the rest of the function to run
    tmux new-session -d -s "$session_name"
    # Split vertically, making the bottom pane 25% of the total height
    tmux split-pane -v -l 25%
    # Split the top pane horizontally
    tmux split-pane -h
    # Select pane 1 (top-right) and open nvim
    tmux selectp -t 1
    tmux send-keys "nvim" C-m
    # Zoom the pane with nvim (pane 1 by default, or specified by arg)
    tmux resize-pane -Z -t "$zoom_pane"
    tmux attach-session -d -t "$session_name"
}

# Call the function with all provided arguments
tmx "$@"
