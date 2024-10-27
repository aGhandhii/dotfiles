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
if [[ "$(command -v lsd)" != "" ]]; then
    alias ls="lsd"
    alias la="lsd -a"
    alias ll="lsd -l"
    alias cls="clear; lsd -a"
else
    alias ls="ls --color=auto"
    alias la="ls -a --color=auto"
    alias ll="ls -l --color=auto"
    alias cls="clear; ls -a --color=auto"
fi
alias grph="git rev-parse HEAD"
function gs   { git status "$@"; }
function gl   { git log "$@"; }
function ga   { git add "$@"; }
function gp   { git push "$@"; }
function gb   { git branch "$@"; }
function gc   { git commit "$@"; }
function gch  { git checkout "$@"; }
function gr   { git rebase "$@"; }
function grih { git rebase -i HEAD~"$1"; }

#}}}

# UTILITY FUNCTIONS: {{{

# Show git branch, if available
function git_branch_name {
    BRANCH="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' -e 's/[ ()]//g')"
    if [ "$BRANCH" != "" ]; then echo "$BRANCH"; else echo ""; fi
}

# Show git tag, if available
function git_tag_name {
    TAG="$(git describe --exact-match --tags 2> /dev/null)"
    if [ "$TAG" != "" ]; then echo "󰓼$TAG"; else echo ""; fi
}

#}}}

# COLORS: {{{

# Escape sequences
bg_col="\e[48;"
fg_col="\e[38;"
console_foreground="\e[39m"
console_background="\e[49m"

prompt_text_color="2;40;44;52m"

# Color codes
orange="2;254;128;25m"
gold="2;250;189;47m"
green="2;142;192;124m"
purple="2;211;134;155m"
blue="2;131;165;152m"

#}}}

# STATUS LINE FORMATTING: {{{

# Build Prompt segments with delimiters [,,]
function append_segment {
    contents=$1
    prev_color=$2
    color=$3
    next_color=$4
    first_last=$5
    segment=""

    # Round off the first segment, otherwise use the arrow
    if [[ $first_last == "first" || $first_last == "both" ]]; then
        segment="$segment$fg_col$color$console_background"
    else
        segment="$segment$fg_col$prev_color$bg_col$color"
    fi

    # Display segment contents
    #segment="$segment$console_foreground$bg_col$color$contents"
    segment="$segment$fg_col$prompt_text_color$bg_col$color$contents"

    # Round off last segment
    if [[ $first_last == "last" || $first_last == "both" ]]; then
        segment="$segment$fg_col$color$console_background"
    fi

    # Return the segment
    echo -e $segment
}

# PS1 definition
function prompt_command {
    branch="$(git_branch_name)"
    tag="$(git_tag_name)"
    user="\u"
    host="\h"
    dir="\w"
    prompt="\n-> "

    # Declare PS1 elements
    declare -a prompt_elements
    if [[ $branch != "" ]]; then prompt_elements+=($branch $orange); fi
    if [[ $tag != "" ]];    then prompt_elements+=($tag $gold);      fi
    prompt_elements+=($user $green)
    prompt_elements+=($host $purple)
    prompt_elements+=($dir  $blue)

    # Clear current statusline and append specified elements
    PS1=""
    num_elements=${#prompt_elements[@]}
    for (( index=0; index<$num_elements; index+=2 ))
    do
        contents="${prompt_elements[$index]}"
        prev_color="null"
        color="${prompt_elements[$index+1]}"
        next_color="null"
        first_last="null"
        # Test for first or last segment
        if [[ $index == 0 && $index+2 -ge $num_elements ]]; then
            first_last="both"
        elif [[ $index == 0 ]]; then
            first_last="first"
            next_color="${prompt_elements[$index+3]}"
        elif [[ $index+2 -ge $num_elements ]]; then
            first_last="last"
            prev_color="${prompt_elements[$index-1]}"
        else
            prev_color="${prompt_elements[$index-1]}"
            next_color="${prompt_elements[$index+3]}"
        fi
        PS1="$PS1$(append_segment $contents $prev_color $color $next_color $first_last)"
    done

    # Last step, append prompt at end of status line
    PS1="$PS1$console_foreground$prompt"
}
export PROMPT_COMMAND=prompt_command

#}}}
