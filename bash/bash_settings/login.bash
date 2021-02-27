# remap caps -> super
setxkbmap -option caps:super

# gen, set LSCOLORS var
if [[ -e ~/.dir_colors/bliss.dircolors ]]; then
	eval `dircolors ~/.dir_colors/bliss.dircolors`
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# get current branch in git repo
parse_git_branch() {
	BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

	if [ ! "$BRANCH" == "" ]; then
		STAT=$(parse_git_dirty)
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
parse_git_dirty() {
	status=$(git status 2>&1 | tee)

	dirty=$(echo -n "$status" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?")
	untracked=$(echo -n "$status" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?")
	ahead=$(echo -n "$status" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?")
	newfile=$(echo -n "$status" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?")
	renamed=$(echo -n "$status" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?")
	deleted=$(echo -n "$status" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?")

	bits=''

	if [ "$renamed" == "0" ]; then
		bits=">${bits}"
	fi

	if [ "$ahead" == "0" ]; then
		bits="*${bits}"
	fi

	if [ "$newfile" == "0" ]; then
		bits="+${bits}"
	fi

	if [ "$untracked" == "0" ]; then
		bits="?${bits}"
	fi

	if [ "$deleted" == "0" ]; then
		bits="x$bits"
	fi
	if [ "$dirty" == "0" ]; then
		bits="!$bits"
	fi
	if [ ! "$bits" == "" ]; then
		echo " $bits"
	else
		echo ""
	fi
}

export PS1="\[$(tput setaf 5)\]\u\[\e[m\]\[$(tput setaf 4)\]@\[\e[m\]\[$(tput setaf 2)\]\W\[$(tput setaf 6)\]\`parse_git_branch\`\[$(tput setaf 12)\]::\[\e[m\] "
export PS2="\[$(tput setaf 3)\]continue-->\[\e[m\] "