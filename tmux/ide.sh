#!/bin/bash
# tmux split-window -v -p 30
# tmux split-window -h -p 66
# tmux split-window -h -p 50

tmx () {
    # Use -d to allow the rest of the function to run
    tmux new-session -d -s 0
    tmux split-window -v -p 5
    tmux selectp -t 1
    tmux send-keys "vi" C-m
    tmux new-window -d -n zsh
    tmux new-window -d -n zsh
    # -d to detach any other client (which there shouldn't be,
    # since you just created the session).
    tmux attach-session -d -t 0
}

tmx
