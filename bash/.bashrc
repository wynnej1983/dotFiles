[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

#load in the git branch prompt script
source ~/.git-prompt.sh
source $(brew --prefix nvm)/nvm.sh
PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/Users/wynnej1983/.gem/ruby/2.0.0/bin
#export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_HOME=$HOME/android-sdk-macosx/
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
