# remap caps -> super
setxkbmap -option caps:super 2>/dev/null

# LSCOLORS config
if [[ -e ~/.dir_colors/dircolors ]]; then
	eval `dircolors ~/.dir_colors/dircolors`
fi

# GCC color config
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# get current branch in git repo
parse_git_branch() {
	local stat branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

	if [[ ! -z "$branch" ]]; then
		stat=$(parse_git_dirty)
		echo " (${branch}${stat})"
	else
		echo ""
	fi
}

# get current status of git repo
parse_git_dirty() {
	local status=$(git status 2>&1 | tee)

	local dirty=$(echo -n "$status" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?")
	local untracked=$(echo -n "$status" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?")
	local ahead=$(echo -n "$status" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?")
	local newfile=$(echo -n "$status" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?")
	local renamed=$(echo -n "$status" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?")
	local deleted=$(echo -n "$status" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?")

	local bits=''

	[[ "$renamed" == "0" ]] && bits=">${bits}"

	[[ "$ahead" == "0" ]] && bits="*${bits}"

	[[ "$newfile" == "0" ]] && bits="+${bits}"

	[[ "$untracked" == "0" ]] && bits="?${bits}"

	[[ "$deleted" == "0" ]] && bits="x$bits"

	[[ "$dirty" == "0" ]] && bits="!$bits"

	[[ ! -z "$bits" ]] && echo " $bits" || echo ""

}

# prompts
export PS1="\[$(tput setaf 5)\]\u\[\e[m\]\[$(tput setaf 4)\]@\[\e[m\]\[$(tput setaf 2)\]\W\[$(tput setaf 6)\]\`parse_git_branch\`\[$(tput setaf 12)\] =>\[\e[m\] "
export PS2="\[$(tput setaf 3)\]continue-->\[\e[m\] "
