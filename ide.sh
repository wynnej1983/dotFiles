#!/bin/bash
tmx () {
    local session_name="${1:-$(basename "$(pwd)")}"
    local zoom_pane="${2:-0}"
    local playlist_file="$HOME/.cache/mfp-playlist.txt"
    local music_session="music"

    # First run: fetch synchronously (we need the file before launching mpv)
    if [[ ! -f "$playlist_file" ]]; then
        mkdir -p "$(dirname "$playlist_file")"
        curl -s --max-time 5 https://musicforprogramming.net/rss.xml \
            | grep -oE 'https://datashat\.net/[^<"]+\.mp3' \
            | sort -u > "$playlist_file"
    # Cache stale: refresh in background, don't block startup
    elif [[ -n $(find "$playlist_file" -mtime +7 2>/dev/null) ]]; then
        (curl -s --max-time 5 https://musicforprogramming.net/rss.xml \
            | grep -oE 'https://datashat\.net/[^<"]+\.mp3' \
            | sort -u > "$playlist_file") &
        disown
    fi

    # Bail out clearly if the playlist is empty
    if [[ ! -s "$playlist_file" ]]; then
        echo "ERROR: Playlist file is empty or missing: $playlist_file"
        return 1
    fi

    # Start music session if it doesn't already exist
    if ! tmux has-session -t "$music_session" 2>/dev/null; then
        tmux new-session -d -s "$music_session" \
            "mpv --no-video --shuffle --loop-playlist --playlist='$playlist_file'"
    fi

    # Window 10: vim — nvim on top (75%), two terminals on bottom (25%)
    tmux new-session -d -s "$session_name" -n vim
    tmux split-pane -v -l 25% -t "$session_name:vim"
    tmux split-pane -h -t "$session_name:vim"
    tmux select-pane -t "$session_name:vim.0"
    tmux send-keys -t "$session_name:vim.0" "nvim" C-m
    tmux resize-pane -Z -t "$session_name:vim.$zoom_pane"

    # Window 2: claude (continue previous session, connect to nvim)
    tmux new-window -t "$session_name" -n claude
    tmux send-keys -t "$session_name:claude" "claude --continue --ide" C-m

    # Window 3: codex (continue previous session)
    tmux new-window -t "$session_name" -n codex
    tmux send-keys -t "$session_name:codex" "codex continue" C-m

    # Land on the vim window
    tmux select-window -t "$session_name:vim"
    tmux attach-session -d -t "$session_name"
}
tmx "$@"
