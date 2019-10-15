#!/bin/bash
#=========================================
# Custom .bashrc
#=========================================

# ===================================================================================================== #
#          Old Bash Prompt with git (Mac OS was too slow to handle this so I had to change it)          #
# ===================================================================================================== #

 git_branch() {
     git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
 }

 git_status() {
     local status
     status="$(git status --porcelain 2>/dev/null)"
     local output=''
     [[ -n $(egrep '^[MADRC]' <<<"$status") ]] && output="$output+"
     [[ -n $(egrep '^.[MD]' <<<"$status") ]] && output="$output!"
     [[ -n $(egrep '^\?\?' <<<"$status") ]] && output="$output?"
     [[ -n $(git stash list) ]] && output="${output}S"
     [[ -n $(git log --branches --not --remotes) ]] && output="${output}P"
     [[ -n $output ]] && output="|$output"   separate from branch name
     echo "$output"
 }

 git_color() {
     local staged
     staged=$([[ $1 =~ \+ ]] && echo yes)
     local dirty
     dirty=$([[ $1 =~ [!\?] ]] && echo yes)
     if [[ -n $staged ]] && [[ -n $dirty ]]; then
         echo -e '\033[1;33m'   bold yellow
     elif [[ -n $staged ]]; then
         echo -e '\033[1;32m'   bold green
     elif [[ -n $dirty ]]; then
         echo -e '\033[1;31m'   bold red
     else
         echo -e '\033[36m'   bold cyan
     fi
 }

 git_prompt() {
     local branch
     branch=$(git_branch)
     if [[ -n $branch ]]; then
         local state
         state=$(git_status)

         local color
         color=$(git_color "$state")
         echo -e "\x01$color\x02[$branch$state]\x01\033[00m\x02"   last bit resets color
     fi
 }

export PS1="\[\e[96m\]\W\[\033[32m\]\$(git_prompt)\[\033[00m\] \[\e[93m\]ツ\[\033[00m\] "

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


#Custom PS1 prompt that includes the current folder, git information and a sUpEr WoW cOoL character
# Bold => \e[1m
# Cyan => \e[96m
# Magenta => \e[95m
# Blue => \e[94m
# Yellow => \e[93m
# Green => \e[92m
# Red => \e[91m
# PS1='$debian_chroot\[\e[95m\]\W \[$(tput sgr0)\]\[\e[1m\]$(git_prompt)\[\e[21m\]\[\033[00m\] \[\e[1m\e[91m\]$\[\e[0m\]  '
# PS1='$debian_chroot${git_prompt} '
alias ls='ls -Gfh'
alias lx='ls -la'
alias l='ls -la'
alias gp='git pull'
alias gl='git log --all --decorate --oneline --graph'
alias gt='git status'
alias gm='git commit -m'
alias ..='cd ../'
alias activate='. venv/bin/activate'
alias mysqldump='mysqldump --column-statistics=0'

# If script is present
if [ -f "$HOME/.custom_bash/create-venv.sh" ]; then
    alias create-venv='bash $HOME/.custom_bash/create-venv.sh'
fi

if [ -f "$HOME/.custom_bash/take-snapshot.sh" ]; then
    alias rds-snapshot='bash $HOME/.custom_bash/take-snapshot.sh'
fi
