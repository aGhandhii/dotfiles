# GENERAL SETTINGS: {{{

# Expand history size and delete duplicate entries
export HISTSIZE=500
export HISTCONTROL=erasedups

# Force color terminal (fixes ssh issues with Kitty terminal)
export TERM=xterm-256color

#}}}

# ALIASES: {{{

alias :q="exit"
alias c=clear
# alias ls="ls --color=auto"
# alias la="ls -a --color=auto"
# alias ll="ls -l --color=auto"
# alias cls="clear; ls -a --color=auto"
alias ls="lsd"
alias la="lsd -a"
alias ll="lsd -l"
alias cls="clear; lsd -a"

#}}}

# GIT SHORTCUTS {{{

alias grph="git rev-parse HEAD"

function gs() {
    git status "$@"
}
export -f gs

function gl() {
    git log "$@"
}
export -f gl

function ga() {
    git add "$@"
}
export -f ga

function gp() {
    git push "$@"
}
export -f gp

function gb() {
    git branch "$@"
}
export -f gb

function gc() {
    git commit "$@"
}
export -f gc

function gr() {
    git rebase "$@"
}
export -f gr

function grih() {
    git rebase -i HEAD~"$1"
}
export -f grih

#}}}

# UTILITY FUNCTIONS: {{{

# Show git branch, if available
function git_branch_name() {
    BRANCH="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' -e 's/[ ()]//g')"
    if [ "$BRANCH" != "" ]; then
        echo "$BRANCH "
    else
        echo ""
    fi
}

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
    PS1="$orange$(git_branch_name)$jade$user$purple$host$blue$dir$white$prompt"
}
export PROMPT_COMMAND=prompt_command

#}}}
