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

## Show git tag, if available
#function git_tag_name() {
#    TAG="$()"
#    if [ "$TAG" != "" ]; then
#        echo "󰓼$TAG "
#    else
#        echo ""
#    fi
#}

#}}}

# COLORS: {{{

bg_col="\e[48;"
fg_col="\e[38;"

console_background="2;40;44;52m"
orange="2;254;128;25m"
green="2;142;192;124m"
purple="2;211;134;155m"
blue="2;131;165;152m"
white="\e[38;5;255m"

#}}}

# STATUS LINE FORMATTING: {{{

# PS1 Elements
user="\u "
host="\h "
dir="\w"
prompt="\n-> "

# Build Prompt segments with delimiters [,,]
function add_prompt_segment {
    contents=$1
    prev_color=$2
    color=$3
    next_color=$4
    first_last=$5
    segment=""

    # Round off the first segment, otherwise use the arrow
    if [[ $first_last == "first" ]]; then
        segment="$segment$fg_col$color$bg_col$prev_color"
        segment="$segment"
    else
        segment="$segment$fg_col$prev_color$bg_col$color"
        segment="$segment"
    fi

    # Display segment contents
    segment="$segment$fg_col$console_background$bg_col$color$contents"

    # Round off last segment
    if [[ $first_last == "last" ]]; then
        segment="$segment$fg_col$color$bg_col$console_background"
        segment="$segment"
    fi

    # Return the segment
    echo -e $segment
}

# PS1 definition
function prompt_command {
    branch="$(git_branch_name)"
    PS1=""
    if [[ $branch != "" ]]; then
        PS1+="$(add_prompt_segment $branch $console_background $orange $green first)"
        PS1+="$(add_prompt_segment $user $orange $green $purple)"
    else
        PS1+="$(add_prompt_segment $user $console_background $green $purple first)"
    fi
    PS1+="$(add_prompt_segment $host $green $purple $blue)"
    PS1+="$(add_prompt_segment $dir $purple $blue $console_background last)"
    PS1+="$white$prompt"
}
export PROMPT_COMMAND=prompt_command

#}}}
