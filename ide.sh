#!/bin/bash

tmx () {
    # Use -d to allow the rest of the function to run
    tmux new-session -d -s 0
    tmux split-window -v -p 10
    tmux split-window -h -p 50
    tmux selectp -t 1
    tmux send-keys "nvim" C-m
    tmux attach-session -d -t 0
}

tmx
