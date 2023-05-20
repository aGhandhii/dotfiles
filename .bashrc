# GENERAL SETTINGS: {{{

# Expand history size and delete duplicate entries
export HISTSIZE=500
export HISTCONTROL=erasedups

# Force color terminal (fixes ssh issues with Kitty terminal)
export TERM=xterm-256color

#}}}

# ALIASES: {{{

# General
alias :q="exit"
alias c=clear
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"

# For College CS Courses
alias seaside="ssh apghand@seaside.cs.washington.edu"

# Onedrive easy access
alias onedrive="cd '/c/Users/ghand/OneDrive - UW/Documents/OneDrive - UW/Year 3 - Junior/Q3 - Spring 2023'"

# Git Shortcuts
alias gut="git"
alias got="git"
alias gs="git status"
alias gl="git log"
alias gaa="git add -A"
alias gc="git commit"
alias gb="git branch"
alias gca="git commit --amend"
alias gp="git push"
alias gpf="git push --force"
alias gro="git rebase origin"

#}}}

# UTILITY FUNCTIONS: {{{

# Show git branch, if available
function git_branch_name() {
    BRANCH="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' -e 's/[ ()]//g')"
    if [ "$BRANCH" != "" ]; then
        echo "$BRANCH "
    else
        echo ""
    fi
}

# Easy Interactive Rebase
function grih() {
    git rebase -i HEAD~"$1"
}
export -f grih

#}}}

# COLORS: {{{

orange="\e[38;5;214m"
green="\e[38;5;76m"
purple="\e[38;5;147m"
pink="\e[38;5;213m"
jade="\e[38;5;120m"
blue="\e[38;5;81m"
white="\e[38;5;255m"

#}}}

# STATUS LINE FORMATTING: {{{

# PS1 Elements
user="\u "
host="\h "
dir="\w \n"
prompt="-> "

# PS1 definition
# use 'prompt_command' to force update after each bash command
function prompt_command {
    PS1="$orange$(git_branch_name)$green$user$pink$host$blue$dir$white$prompt"
}
export PROMPT_COMMAND=prompt_command

#}}}
