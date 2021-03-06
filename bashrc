#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=1000
HISTFILESIZE=3000

shopt -s checkwinsize

#PS1='[\u@\h \W]\$ '
PS1='[\W]\$ '
#PS1='\$ '

alias ls='ls --color=auto'
alias l='\ls -F'
alias ll='ls -alhF --color=auto'

# do not output the trailing newline &
# enable interpretation of backslash escapes
alias echo='echo -ne'
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias vi='vim'
alias emacs='emacs -nw'

alias up='cd ../'
alias mm='vi ~/diary/$(date "+%Y/%m/%d.md")'

jj () {
	if [ $1 ]; then
		dir_list=$(find ./ -maxdepth 1 -type d | grep $1)
		count=$(echo $dir_list | sed -e 's/ /\n/g' | grep -c "")
		if [ $count -ne 1 ]; then
			echo 'searched:'
			echo $dir_list
		else
			if [[ -d $dir_list && -n $dir_list ]]; then
				cd $dir_list
			else
				echo 'directory not found'
			fi
		fi
	fi
}

# for V-REP simulator
export LIBOVERLAY_SCROLLBAR=0

# setting for auto completion of git branch name
source $HOME/.git-completion.bash

