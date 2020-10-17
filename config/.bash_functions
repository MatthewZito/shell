base64 () {
  echo $1 | openssl base64
}

rmd () {
  pandoc $1 | lynx -stdin
}