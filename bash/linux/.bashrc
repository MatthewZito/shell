# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# prevent duplicate lines, lines space-prepended in hist
HISTCONTROL=ignoreboth

# append to hist; don't overwrite
shopt -s histappend

# set hist len
HISTSIZE=1000
HISTFILESIZE=2000

# eval window size after ea cmd and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# render less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# config (PS1, etc)
source ~/.bash_conf
# functions
source ~/.bash_functions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# golang
export PATH=$PATH:/usr/local/go/bin