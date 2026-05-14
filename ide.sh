#!/bin/bash
tmx () {
    local session_name="${1:-$(basename "$(pwd)")}"
    local zoom_pane="${2:-0}"
    local playlist_file="$HOME/.cache/mfp-playlist.txt"

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

    # Create new detached session
    tmux new-session -d -s "$session_name"

    # Layout: nvim on top (75%), two terminals on bottom (25%)
    tmux split-pane -v -l 25%
    tmux split-pane -h
    tmux select-pane -t 0
    tmux send-keys "nvim" C-m

    # Music window — launch mpv directly so $playlist_file expands in this shell
    tmux new-window -t "$session_name" -n "music" \
        "mpv --no-video --shuffle --loop-playlist --playlist='$playlist_file'"

    tmux select-window -t "$session_name:1"
    tmux resize-pane -Z -t "$zoom_pane"
    tmux attach-session -d -t "$session_name"
}
tmx "$@"
