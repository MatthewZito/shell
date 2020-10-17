alias apps="cd /Users/${USER}/Applications"
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

if [ -x /usr/local/opt/coreutils/libexec/gnubin/dircolors ]; then
    alias dircolors=/usr/local/opt/coreutils/libexec/gnubin/dircolors
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

eval `dircolors ~/main.dircolors`