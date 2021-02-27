base64() {
  openssl base64<<<"$1"
}

rmd() {
  pandoc "$1" | lynx -stdin
}

add_alias() {
  local alias_body=$1

  echo "alias $alias_body" >> "$HOME/bash_settings/alias.bash"

  (( "$?" == 0 )) && echo "[+] Successfully added new alias"
}

psaux() {
  pgrep -f "$@" | xargs ps -fp 2>/dev/null
}

open_enc() {
  local mount="$1" proxy="$2"
  
  encfs ${mount:-~/.enc/} ${proxy:-~/enc/}
}

close_enc() {
  local proxy="$1"

  fusermount -u ${proxy:-~/enc}
}
