# base64 conversion
base64() {
  echo "$1" | openssl base64
}

# render markdown
rmd() {
  pandoc "$1" | lynx -stdin
}

add_alias() {
  local alias_body=$1

  echo "alias $alias_body" >> "$HOME/settings/alias.bash"

  echo "[+] Successfully added new alias"
}