# base64 conversion
base64 () {
  echo $1 | openssl base64
}
# render markdown
rmd () {
  pandoc $1 | lynx -stdin
}
