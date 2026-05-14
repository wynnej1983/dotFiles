#!/usr/bin/env bash
# macOS system preferences
# Run with: bash macos/defaults.sh
# Some settings require logout/restart to take effect.

set -e

echo "Applying macOS defaults..."

# ===== Keyboard =====
# Faster key repeat
defaults write -g KeyRepeat -int 1
# Shorter delay before repeat kicks in
defaults write -g InitialKeyRepeat -int 10

# ===== Add more as you discover them =====
# Examples to consider:
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false  # repeat keys instead of showing accent menu
# defaults write com.apple.finder AppleShowAllFiles -bool true        # show hidden files in Finder
# defaults write com.apple.dock autohide -bool true                   # auto-hide dock

echo "Done. Some changes require logout/restart to take effect."
echo "For keyboard changes, log out and log back in."
