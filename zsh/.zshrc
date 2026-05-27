# =============================================================================
# Performance profiling (uncomment to debug startup time)
# =============================================================================
# zmodload zsh/zprof

# =============================================================================
# Oh My Zsh
# =============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_PROMPT_ASYNC=false

plugins=(
  git
  vi-mode
  vim-interaction
  npm
  iterm2
  zsh-autosuggestions
)
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

source $ZSH/oh-my-zsh.sh

# =============================================================================
# Editor
# =============================================================================
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export REACT_EDITOR="nvim"
export GIT_EDITOR="nvim"

# =============================================================================
# PATH (consolidated — order matters: earlier entries win)
# =============================================================================
typeset -U path PATH  # automatically dedupes PATH

path=(
  # Homebrew (Apple Silicon takes priority)
  /opt/homebrew/bin
  /opt/homebrew/opt/postgresql@15/bin
  /opt/homebrew/sbin

  # Personal binaries
  $HOME/.local/bin
  $HOME/bin

  # Language version managers / runtimes
  $HOME/.cargo/bin
  $HOME/.bun/bin
  $HOME/.yarn/bin
  $HOME/.config/yarn/global/node_modules/.bin
  $HOME/.rbenv/shims
  $HOME/.foundry/bin
  $HOME/.rvm/bin

  # Go
  $HOME/golang/bin
  /usr/local/opt/go/libexec/bin

  # Java / Android
  /Library/Java/JavaVirtualMachines/temurin-22.jdk/Contents/Home/bin
  $HOME/Library/Android/sdk/emulator
  $HOME/Library/Android/sdk/tools
  $HOME/Library/Android/sdk/tools/bin
  $HOME/Library/Android/sdk/platform-tools

  # Legacy Homebrew formulas
  /usr/local/opt/openjdk@11/bin
  /usr/local/opt/imagemagick@6/bin

  # Postgres.app
  /Applications/Postgres.app/Contents/Versions/latest/bin

  # System defaults
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
)
export PATH

# =============================================================================
# Environment variables (non-secret)
# =============================================================================
export GOPATH="$HOME/golang"
export GOROOT="/usr/local/opt/go/libexec"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-22.jdk/Contents/Home"
#export ANDROID_HOME="$HOME/Library/Android/sdk"
#export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
export ANDROID_SDK_ROOT="/opt/homebrew/share/android-commandlinetools"
export ANDROID_NDK_HOME="$HOME/Library/Android/sdk/ndk/22.1.7171670"
export ANT_HOME="/usr/local/opt/ant"
export MAVEN_HOME="/usr/local/opt/maven"
export GRADLE_HOME="/usr/local/opt/gradle"
export RX_NO_UPDATE=true

# Hardcoded — was `$(brew --prefix mysql-client)/lib/pkgconfig` (slow on every shell)
# Re-run `brew --prefix mysql-client` if mysql-client moves and update this:
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client/lib/pkgconfig"

# =============================================================================
# NVM — lazy loaded for speed, but real node binary stays on PATH
# Only `nvm` itself is lazy-loaded. `node`, `npm`, `npx` are real binaries
# on PATH so Neovim/Copilot and other tools can find them.
# =============================================================================
export NVM_DIR="$HOME/.nvm"

# Lazy-load nvm itself: only initialize when you actually call `nvm`
nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    nvm "$@"
}

# Add the default node version's bin directly to PATH
if [[ -s "$NVM_DIR/alias/default" ]]; then
    NVM_DEFAULT=$(cat "$NVM_DIR/alias/default")
    if [[ "$NVM_DEFAULT" =~ ^[0-9]+$ ]]; then
        NVM_NODE_BIN=$(ls -d "$NVM_DIR/versions/node/v${NVM_DEFAULT}".* 2>/dev/null | sort -V | tail -1)/bin
    else
        while [[ -s "$NVM_DIR/alias/$NVM_DEFAULT" ]]; do
            NVM_DEFAULT=$(cat "$NVM_DIR/alias/$NVM_DEFAULT")
        done
        NVM_NODE_BIN="$NVM_DIR/versions/node/v${NVM_DEFAULT#v}/bin"
    fi
    if [[ -d "$NVM_NODE_BIN" ]]; then
        path=("$NVM_NODE_BIN" $path)
        export PATH
    fi
    unset NVM_DEFAULT NVM_NODE_BIN
fi

# =============================================================================
# pyenv (only load if installed)
# =============================================================================
export PYENV_ROOT="$HOME/.pyenv"
if [[ -d "$PYENV_ROOT/bin" ]]; then
    path=("$PYENV_ROOT/bin" $path)
    export PATH
fi

# =============================================================================
# Bun completions
# =============================================================================
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# =============================================================================
# Aliases
# =============================================================================
source "$HOME/.aliases"

# =============================================================================
# Secrets (API keys, tokens — kept in a separate file, not committed)
# =============================================================================
[ -f "$HOME/.secrets" ] && source "$HOME/.secrets"

# =============================================================================
# Performance profiling output (uncomment with zmodload at top)
# =============================================================================
# zprof
