# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# "alert" alias for long running commands. Usage:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias repos="cd ~/repositories"
alias open="xdg-open"
alias vpn="expressvpn"
# purge bash hist
alias purgehist="cat /dev/null > ~/.bash_history"

