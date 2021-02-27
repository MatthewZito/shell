SETTINGS_DIR="$HOME/bash_settings"

# source env
if [[ ! (( $LOGIN_SET )) ]];then
 source "$SETTINGS_DIR/env.bash"
fi

# source configs
source "$SETTINGS_DIR/cmd.bash"
# source aliases
source "$SETTINGS_DIR/alias.bash"

if [[ $- == *i* && ! (( $LOGIN_SET )) ]]; then
  source "$SETTINGS_DIR/interactive.bash"
fi

if [[ $- == *i* ]];then
  source "$SETTINGS_DIR/login.bash"
fi

export LOGIN_SET=1

unset -v SETTINGS_DIR
