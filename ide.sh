#!/bin/bash

tmx () {
    # If no session name provided, use the basename of the current working directory
    local session_name="${1:-$(basename "$(pwd)")}"
    local zoom_pane="${2:-0}"  # Default to zooming pane 0 if no second argument

    # Use -d to allow the rest of the function to run
    tmux new-session -d -s "$session_name"
    # Split vertically, making the bottom pane 25% of the total height
    tmux split-pane -v -l 25%
    tmux split-pane -h
    tmux selectp -t 1
    tmux send-keys "nvim" C-m
    # Zoom the specified pane to fullscreen (default is top pane, 0)
    tmux resize-pane -Z -t "$zoom_pane"
    tmux attach-session -d -t "$session_name"
}

# Call the function with all provided arguments
tmx "$@"
